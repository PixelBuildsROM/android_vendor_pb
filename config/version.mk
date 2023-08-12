# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Internal version
PB_VERSION := 1.0-alpha

# Platform version
PLAT_VERSION := 13.0

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(PB_BUILD))
PIXELBUILDS_VERSION := PixelBuilds_$(TARGET_PRODUCT_SHORT)-$(PLAT_VERSION)_$(PB_VERSION)-$(shell date +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.custom=$(PB_VERSION) \
    ro.build.version.device=$(TARGET_PRODUCT_SHORT) \
    ro.pb.build.version=$(PIXELBUILDS_VERSION) \
    ro.modversion=$(PB_VERSION)
