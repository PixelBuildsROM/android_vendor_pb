function __print_pixelbuilds_functions_help() {
cat <<EOF
Additional PixelBuilds functions:
- cout:            Changes directory to out.
- pbgerrit:        A Git wrapper that fetches/pushes patch from/to PixelBuilds Gerrit Review.
- pbrebase:        Rebase a Gerrit change and push it again.
- pbremote:        Add git remote for PixelBuilds Gerrit Review.
- repodiff:        Diff 2 different branches or tags within the same repo
- repolastsync:    Prints date and time of last repo sync.
- repopick:        Utility to fetch changes from Gerrit.
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
EOF
}

function cout()
{
    if [  "$OUT" ]; then
        cd $OUT
    else
        echo "Couldn't locate out directory.  Try setting OUT."
    fi
}

function pbgerrit() {
    if [ "$(basename $SHELL)" = "zsh" ]; then
        # zsh does not define FUNCNAME, derive from funcstack
        local FUNCNAME=$funcstack[1]
    fi

    if [ $# -eq 0 ]; then
        $FUNCNAME help
        return 1
    fi
    local user=`git config --get review.review.pixelbuilds.org.username`
    local review=`git config --get remote.pixelbuilds.review`
    local project=`git config --get remote.pixelbuilds.projectname`
    local command=$1
    shift
    case $command in
        help)
            if [ $# -eq 0 ]; then
                cat <<EOF
Usage:
    $FUNCNAME COMMAND [OPTIONS] [CHANGE-ID[/PATCH-SET]][{@|^|~|:}ARG] [-- ARGS]
Commands:
    fetch   Just fetch the change as FETCH_HEAD
    help    Show this help, or for a specific command
    pull    Pull a change into current branch
    push    Push HEAD or a local branch to Gerrit for a specific branch
Any other Git commands that support refname would work as:
    git fetch URL CHANGE && git COMMAND OPTIONS FETCH_HEAD{@|^|~|:}ARG -- ARGS
See '$FUNCNAME help COMMAND' for more information on a specific command.
Example:
    $FUNCNAME checkout -b topic 1234/5
works as:
    git fetch http://DOMAIN/p/PROJECT refs/changes/34/1234/5 \\
      && git checkout -b topic FETCH_HEAD
will checkout a new branch 'topic' base on patch-set 5 of change 1234.
Patch-set 1 will be fetched if omitted.
EOF
                return
            fi
            case $1 in
                __cmg_*) echo "For internal use only." ;;
                changes|for)
                    if [ "$FUNCNAME" = "pbgerrit" ]; then
                        echo "'$FUNCNAME $1' is deprecated."
                    fi
                    ;;
                help) $FUNCNAME help ;;
                fetch|pull) cat <<EOF
usage: $FUNCNAME $1 [OPTIONS] CHANGE-ID[/PATCH-SET]
works as:
    git $1 OPTIONS http://DOMAIN/p/PROJECT \\
      refs/changes/HASH/CHANGE-ID/{PATCH-SET|1}
Example:
    $FUNCNAME $1 1234
will $1 patch-set 1 of change 1234
EOF
                    ;;
                push) cat <<EOF
usage: $FUNCNAME push [OPTIONS] [LOCAL_BRANCH:]REMOTE_BRANCH
works as:
    git push OPTIONS ssh://USER@DOMAIN:29418/PROJECT \\
      {LOCAL_BRANCH|HEAD}:refs/for/REMOTE_BRANCH
Example:
    $FUNCNAME push fix6789:gingerbread
will push local branch 'fix6789' to Gerrit for branch 'gingerbread'.
HEAD will be pushed from local if omitted.
EOF
                    ;;
                *)
                    $FUNCNAME __cmg_err_not_supported $1 && return
                    cat <<EOF
usage: $FUNCNAME $1 [OPTIONS] CHANGE-ID[/PATCH-SET][{@|^|~|:}ARG] [-- ARGS]
works as:
    git fetch http://DOMAIN/p/PROJECT \\
      refs/changes/HASH/CHANGE-ID/{PATCH-SET|1} \\
      && git $1 OPTIONS FETCH_HEAD{@|^|~|:}ARG -- ARGS
EOF
                    ;;
            esac
            ;;
        __cmg_get_ref)
            $FUNCNAME __cmg_err_no_arg $command $# && return 1
            local change_id patchset_id hash
            case $1 in
                */*)
                    change_id=${1%%/*}
                    patchset_id=${1#*/}
                    ;;
                *)
                    change_id=$1
                    patchset_id=1
                    ;;
            esac
            hash=$(($change_id % 100))
            case $hash in
                [0-9]) hash="0$hash" ;;
            esac
            echo "refs/changes/$hash/$change_id/$patchset_id"
            ;;
        fetch|pull)
            $FUNCNAME __cmg_err_no_arg $command $# help && return 1
            $FUNCNAME __cmg_err_not_repo && return 1
            local change=$1
            shift
            git $command $@ http://$review/p/$project \
                $($FUNCNAME __cmg_get_ref $change) || return 1
            ;;
        push)
            $FUNCNAME __cmg_err_no_arg $command $# help && return 1
            $FUNCNAME __cmg_err_not_repo && return 1
            if [ -z "$user" ]; then
                echo >&2 "Gerrit username not found."
                return 1
            fi
            local local_branch remote_branch
            case $1 in
                *:*)
                    local_branch=${1%:*}
                    remote_branch=${1##*:}
                    ;;
                *)
                    local_branch=HEAD
                    remote_branch=$1
                    ;;
            esac
            shift
            git push $@ ssh://$user@$review:29418/$project \
                ${local_branch}:refs/for/$remote_branch || return 1
            ;;
        changes|for)
            if [ "$FUNCNAME" = "pbgerrit" ]; then
                echo >&2 "'$FUNCNAME $command' is deprecated."
            fi
            ;;
        __cmg_err_no_arg)
            if [ $# -lt 2 ]; then
                echo >&2 "'$FUNCNAME $command' missing argument."
            elif [ $2 -eq 0 ]; then
                if [ -n "$3" ]; then
                    $FUNCNAME help $1
                else
                    echo >&2 "'$FUNCNAME $1' missing argument."
                fi
            else
                return 1
            fi
            ;;
        __cmg_err_not_repo)
            if [ -z "$review" -o -z "$project" ]; then
                echo >&2 "Not currently in any reviewable repository."
            else
                return 1
            fi
            ;;
        __cmg_err_not_supported)
            $FUNCNAME __cmg_err_no_arg $command $# && return
            case $1 in
                #TODO: filter more git commands that don't use refname
                init|add|rm|mv|status|clone|remote|bisect|config|stash)
                    echo >&2 "'$FUNCNAME $1' is not supported."
                    ;;
                *) return 1 ;;
            esac
            ;;
    #TODO: other special cases?
        *)
            $FUNCNAME __cmg_err_not_supported $command && return 1
            $FUNCNAME __cmg_err_no_arg $command $# help && return 1
            $FUNCNAME __cmg_err_not_repo && return 1
            local args="$@"
            local change pre_args refs_arg post_args
            case "$args" in
                *--\ *)
                    pre_args=${args%%-- *}
                    post_args="-- ${args#*-- }"
                    ;;
                *) pre_args="$args" ;;
            esac
            args=($pre_args)
            pre_args=
            if [ ${#args[@]} -gt 0 ]; then
                change=${args[${#args[@]}-1]}
            fi
            if [ ${#args[@]} -gt 1 ]; then
                pre_args=${args[0]}
                for ((i=1; i<${#args[@]}-1; i++)); do
                    pre_args="$pre_args ${args[$i]}"
                done
            fi
            while ((1)); do
                case $change in
                    ""|--)
                        $FUNCNAME help $command
                        return 1
                        ;;
                    *@*)
                        if [ -z "$refs_arg" ]; then
                            refs_arg="@${change#*@}"
                            change=${change%%@*}
                        fi
                        ;;
                    *~*)
                        if [ -z "$refs_arg" ]; then
                            refs_arg="~${change#*~}"
                            change=${change%%~*}
                        fi
                        ;;
                    *^*)
                        if [ -z "$refs_arg" ]; then
                            refs_arg="^${change#*^}"
                            change=${change%%^*}
                        fi
                        ;;
                    *:*)
                        if [ -z "$refs_arg" ]; then
                            refs_arg=":${change#*:}"
                            change=${change%%:*}
                        fi
                        ;;
                    *) break ;;
                esac
            done
            $FUNCNAME fetch $change \
                && git $command $pre_args FETCH_HEAD$refs_arg $post_args \
                || return 1
            ;;
    esac
}


function pbrebase() {
    local repo=$1
    local refs=$2
    local pwd="$(pwd)"
    local dir="$(gettop)/$repo"

    if [ -z $repo ] || [ -z $refs ]; then
        echo "PixelBuilds Gerrit Rebase Usage: "
        echo "      pbrebase <path to project> <patch IDs on Gerrit>"
        echo "      The patch IDs appear on the Gerrit commands that are offered."
        echo "      They consist on a series of numbers and slashes, after the text"
        echo "      refs/changes. For example, the ID in the following command is 26/8126/2"
        echo ""
        echo "      git[...]ges_apps_Camera refs/changes/26/8126/2 && git cherry-pick FETCH_HEAD"
        echo ""
        return
    fi

    if [ ! -d $dir ]; then
        echo "Directory $dir doesn't exist in tree."
        return
    fi
    cd $dir
    repo=$(cat .git/config  | grep git://github.com | awk '{ print $NF }' | sed s#git://github.com/##g)
    echo "Starting branch..."
    repo start tmprebase .
    echo "Bringing it up to date..."
    repo sync .
    echo "Fetching change..."
    git fetch "http://review.pixelbuilds.org/p/$repo" "refs/changes/$refs" && git cherry-pick FETCH_HEAD
    if [ "$?" != "0" ]; then
        echo "Error cherry-picking. Not uploading!"
        return
    fi
    echo "Uploading..."
    repo upload .
    echo "Cleaning up..."
    repo abandon tmprebase .
    cd $pwd
}
function pbremote()
{
    if ! git rev-parse --git-dir &> /dev/null
    then
        echo ".git directory not found. Please run this from the root directory of the Android repository you wish to set up."
        return 1
    fi
    git remote rm pbgerrit 2> /dev/null
    local REMOTE=$(git config --get remote.pixelbuilds.projectname)
    local PIXELBUILDS="true"
    if [ -z "$REMOTE" ]
    then
        REMOTE=$(git config --get remote.aosp.projectname)
        PIXELBUILDS="false"
    fi
    if [ -z "$REMOTE" ]
    then
        REMOTE=$(git config --get remote.caf.projectname)
        PIXELBUILDS="false"
    fi
    if [ $PIXELBUILDS = "false" ]
    then
        local PROJECT=$(echo $REMOTE | sed -e "s#/#_#g")
    else
        local PROJECT=$REMOTE
        local PFX="pixelbuilds/"
    fi
    local PIXELBUILDS_USER=$(git config --get review.review.pixelbuilds.org.username)
    if [ -z "$PIXELBUILDS_USER" ]
    then
        git remote add pbgerrit ssh://review.pixelbuilds.org:29418/$PFX$PROJECT
    else
        git remote add pbgerrit ssh://$PIXELBUILDS_USER@review.pixelbuilds.org:29418/$PFX$PROJECT
    fi
    echo "Remote 'pbgerrit' created"
}

function repodiff() {
    if [ -z "$*" ]; then
        echo "Usage: repodiff <ref-from> [[ref-to] [--numstat]]"
        return
    fi
    diffopts=$* repo forall -c \
      'echo "$REPO_PATH ($REPO_REMOTE)"; git diff ${diffopts} 2>/dev/null ;'
}

function repolastsync() {
    RLSPATH="$ANDROID_BUILD_TOP/.repo/.repo_fetchtimes.json"
    RLSLOCAL=$(date -d "$(stat -c %z $RLSPATH)" +"%e %b %Y, %T %Z")
    RLSUTC=$(date -d "$(stat -c %z $RLSPATH)" -u +"%e %b %Y, %T %Z")
    echo "Last repo sync: $RLSLOCAL / $RLSUTC"
}

function repopick() {
    T=$(gettop)
    $T/vendor/pb/build/tools/repopick.py $@
}

function sort-blobs-list() {
    T=$(gettop)
    $T/tools/extract-utils/sort-blobs-list.py $@
}
