# NucleaRom System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.nr.version=nr-$(NR_VERSION) \
    ro.nr.releasetype=$(NR_TYPE) \
    ro.nr.build.version=NucleaRom-$(NR_VERSION_TAG) \
    ro.modversion=$(NR_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal

# NucleaRom Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.nr.display.version=$(NR_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
