#!/usr/bin/env python3
# Copyright (C) 2012-2013, The CyanogenMod Project
#           (C) 2017-2018,2020-2021, The LineageOS Project
# Copyright (C) 2012-2015, SlimRoms Project
# Copyright (C) 2016-2018, AOSiP
# Copyright (C) 2023-2025, PixelBuildsROM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import base64
import json
import netrc
import os
import sys

from xml.etree import ElementTree

import urllib.error
import urllib.request

DEBUG = False
default_manifest = ".repo/manifest.xml"

custom_local_manifest = ".repo/local_manifests/pixelbuilds_manifest.xml"
custom_default_revision = "infinity-oss"
custom_dependencies = "aosp.dependencies"
org_manifest = "gitea"  # leave empty if org is provided in manifest
org_display = "device-trees"  # needed for displaying

github_auth = None


local_manifests = '.repo/local_manifests'
if not os.path.exists(local_manifests):
    os.makedirs(local_manifests)


def debug(*args, **kwargs):
    if DEBUG:
        print(*args, **kwargs)


# def add_auth(g_req):
#     global github_auth
#     if github_auth is None:
#         try:
#             auth = netrc.netrc().authenticators("api.github.com")
#         except (netrc.NetrcParseError, IOError):
#             auth = None
#         if auth:
#             github_auth = base64.b64encode(
#                 ('%s:%s' % (auth[0], auth[2])).encode()
#             )
#         else:
#             github_auth = ""
#     if github_auth:
#         g_req.add_header("Authorization", "Basic %s" % github_auth)


def indent(elem, level=0):
    # in-place prettyprint formatter
    i = "\n" + "  " * level
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for elem in elem:
            indent(elem, level+1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i


def load_manifest(manifest):
    try:
        man = ElementTree.parse(manifest).getroot()
    except (IOError, ElementTree.ParseError):
        man = ElementTree.Element("manifest")
    return man


def get_default(manifest=None):
    m = manifest or load_manifest(default_manifest)
    d = m.findall('default')[0]
    return d


def get_remote(manifest=None, remote_name=None):
    m = manifest or load_manifest(default_manifest)
    if not remote_name:
        remote_name = get_default(manifest=m).get('remote')
    remotes = m.findall('remote')
    for remote in remotes:
        if remote_name == remote.get('name'):
            return remote


def get_revision(manifest=None, p="build"):
    return custom_default_revision

def get_from_manifest(device_name):
    if os.path.exists(custom_local_manifest):
        man = load_manifest(custom_local_manifest)
        for local_path in man.findall("project"):
            lp = local_path.get("path").strip('/')
            if lp.startswith("device/") and lp.endswith("/" + device_name):
                return lp
    return None


def is_in_manifest(project_path):
    for local_path in load_manifest(custom_local_manifest).findall("project"):
        if local_path.get("path") == project_path:
            return True
    return False


def add_to_manifest(repos, fallback_branch=None):
    lm = load_manifest(custom_local_manifest)

    for repo in repos:

        if 'repository' not in repo: # Remove repo if the name isn't set
            print('Error adding %s', repo)
            del repos[repo]
            continue
        repo_name = repo['repository']
        if 'target_path' in repo:
            repo_path = repo['target_path']
        else: # If path isn't set, its the same as name
            repo_path = repo_name.split('/')[-1]

        if 'branch' in repo:
            repo_branch=repo['branch']
        else:
            repo_branch=custom_default_revision

        if 'remote' in repo:
            repo_remote=repo['remote']
        elif "/" not in repo_name:
            repo_remote=org_manifest
        elif "/" in repo_name:
            repo_remote="gitea"

        if is_in_manifest(repo_path):
            print('%s already exists in the manifest' % repo_path)
            continue

        print('Adding dependency:\nRepository: %s\nBranch: %s\nRemote: %s\nPath: %s\n' % (repo_name, repo_branch,repo_remote, repo_path))

        project = ElementTree.Element(
            "project",
            attrib={"path": repo_path,
                    "remote": repo_remote,
                    "name":  repo_name}
        )

        if repo_branch is not None:
            project.set('revision', repo_branch)
        elif fallback_branch:
            print("Using branch %s for %s" %
                  (fallback_branch, repo_name))
            project.set('revision', fallback_branch)
        else:
            print("Using default branch for %s" % repo_name)
        if 'clone-depth' in repo:
            print("Setting clone-depth to %s for %s" % (repo['clone-depth'], repo_name))
            project.set('clone-depth', repo['clone-depth'])

        lm.append(project)

    indent(lm)
    raw_xml = "\n".join(('<?xml version="1.0" encoding="UTF-8"?>',
                         ElementTree.tostring(lm).decode()))

    f = open(custom_local_manifest, 'w')
    f.write(raw_xml)
    f.close()

_fetch_dep_cache = []


def fetch_dependencies(repo_path, fallback_branch=None):
    global _fetch_dep_cache
    if repo_path in _fetch_dep_cache:
        return
    _fetch_dep_cache.append(repo_path)

    print('Looking for dependencies')

    dep_p = '/'.join((repo_path, custom_dependencies))
    if os.path.exists(dep_p):
        with open(dep_p) as dep_f:
            dependencies = json.load(dep_f)
    else:
        dependencies = {}
        debug('Dependencies file not found, bailing out.')

    fetch_list = []
    syncable_repos = []

    for dependency in dependencies:
        if not is_in_manifest(dependency['target_path']):
            if not dependency.get('branch'):
                dependency['branch'] = (get_revision() or
                                        custom_default_revision)

            fetch_list.append(dependency)
            syncable_repos.append(dependency['target_path'])
        else:
            print("Dependency already present in manifest: %s => %s" % (dependency['repository'], dependency['target_path']))

    if fetch_list:
        print('Adding dependencies to manifest\n')
        add_to_manifest(fetch_list, fallback_branch)

    if syncable_repos:
        print('Syncing dependencies')
        os.system('repo sync --force-sync --no-tags --current-branch --no-clone-bundle %s' % ' '.join(syncable_repos))

    for deprepo in syncable_repos:
        fetch_dependencies(deprepo)


def has_branch(branches, revision):
    return revision in (branch['name'] for branch in branches)


def detect_revision(repo):
    """
    Returns None if using the default revision,
    otherwise returns the branch name.
    """
    print("Checking branch info")

    owner = repo["owner"]["login"]
    repo_name = repo["name"]

    req = urllib.request.Request(
        f"https://git.pixelbuilds.org/api/v1/repos/{owner}/{repo_name}/branches"
    )

    try:
        result = json.loads(
            urllib.request.urlopen(req).read().decode()
        )
    except urllib.error.URLError:
        print("Failed to fetch branch list")
        sys.exit(1)

    calc_revision = get_revision()
    print(f"Calculated revision: {calc_revision}")

    if has_branch(result, calc_revision):
        return calc_revision

    for fallback in os.getenv("ROOMSERVICE_BRANCHES", "").split():
        if has_branch(result, fallback):
            print(f"Using fallback branch: {fallback}")
            return fallback

    if has_branch(result, custom_default_revision):
        print(
            f"Falling back to custom revision: "
            f"{custom_default_revision}"
        )
        return custom_default_revision

    # Optional: fall back to repo default branch
    default_branch = repo.get("default_branch")
    if default_branch and has_branch(result, default_branch):
        print(f"Falling back to default branch: {default_branch}")
        return default_branch

    print("Branches found:")
    for branch in result:
        print(branch["name"])

    print(
        "Use the ROOMSERVICE_BRANCHES environment variable "
        "to specify a list of fallback branches."
    )
    sys.exit(1)


def main():
    global DEBUG
    try:
        depsonly = bool(sys.argv[2] in ['true', 1])
    except IndexError:
        depsonly = False

    if os.getenv('ROOMSERVICE_DEBUG'):
        DEBUG = True

    product = sys.argv[1]
    device = product[product.find("_") + 1:] or product

    if depsonly:
        repo_path = get_from_manifest(device)
        if repo_path:
            fetch_dependencies(repo_path)
        else:
            print("Trying dependencies-only mode on a "
                  "non-existing device tree?")
        sys.exit()

    print(
        f"Device {device} not found. Attempting to retrieve device repository "
        f"from {org_display} Gitea."
    )

    repos_req = urllib.request.Request(
        f"https://git.pixelbuilds.org/api/v1/orgs/{org_display}/repos?limit=1000"
    )

    try:
        repositories = json.loads(
            urllib.request.urlopen(repos_req).read().decode()
        )
    except urllib.error.URLError:
        print("Failed to query Gitea")
        sys.exit(1)
    except ValueError:
        print("Failed to parse return data from Gitea")
        sys.exit(1)

    for repository in repositories:
        repo_name = repository["name"]

        if not (
            repo_name.startswith("android_device_")
            and repo_name.endswith(f"_{device}")
        ):
            continue

        print(f"Found repository: {repo_name}")

        fallback_branch = detect_revision(repository)
        manufacturer = repo_name.split("_")[2]
        repo_path = f"device/{manufacturer}/{device}"

        add_to_manifest(
            [{
                "repository": repo_name,
                "target_path": repo_path
            }],
            fallback_branch
        )

        print("Syncing repository to retrieve project.")
        os.system(
            "repo sync --force-sync --no-tags "
            "--current-branch --no-clone-bundle "
            f"{repo_path}"
        )

        print("Repository synced!")

        fetch_dependencies(repo_path, fallback_branch)

        print("Done")
        sys.exit()

    print(f"No repository found for device {device}")
    sys.exit(1)

if __name__ == "__main__":
    main()