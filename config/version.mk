# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Internal version
PB_VERSION ?= unity-beta
PB_BUID_TYPE ?= unsigned

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(PB_BUILD))
PIXELBUILDS_VERSION ?= PixelBuilds_$(TARGET_PRODUCT_SHORT)-$(PB_VERSION)-$(shell date +%Y%m%d-%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.custom=$(PB_VERSION) \
    ro.build.version.device=$(TARGET_PRODUCT_SHORT) \
    ro.pb.build.version=$(PIXELBUILDS_VERSION) \
    ro.pb.buildtype=$(PB_BUID_TYPE)
