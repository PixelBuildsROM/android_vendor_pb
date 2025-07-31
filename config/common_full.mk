# Inherit common PixelBuilds stuff
$(call inherit-product, vendor/pb/config/common_mobile.mk)

PRODUCT_SIZE := full

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Externally sourced packages
PRODUCT_PACKAGES += \
    Etar \
    ExactCalculator \
    GameSpace \
    Glimpse \
    Jelly \
    OmniJaws \
    Seedvault

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd \
    bash \
    curl \
    getcap \
    htop \
    nano \
    setcap \
    vim \
    rsync

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh
