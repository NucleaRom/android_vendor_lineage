# NucleaRom System Version
# Include versioning information
# Format: Major.minor.maintenance(-TAG)
NR_VERSION_TAG := 8.1-1
export NR_VERSION := $(NR_VERSION_TAG)-$(NR_TAG)
ROM_POSTFIX := $(shell date -u +%Y%m%d)

export NR_BUILD_VERSION := NucleaRom-$(NR_VERSION)-$(TARGET_PRODUCT)-$(ROM_POSTFIX)
export ROM_VERSION := $(NR_VERSION)-$(ROM_POSTFIX)

ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=$(NR_BUILD_VERSION) \
    ro.nr.buildtype=$(NR_BUILDTYPE) \
    ro.nr.version=$(NR_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal

NR_DISPLAY_VERSION := $(NR_BUILD_VERSION)

ADDITIONAL_BUILD_PROPERTIES += \
    ro.nr.display.version=$(NR_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
  ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal
ADDITIONAL_BUILD_PROPERTIES += \
  ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

    





