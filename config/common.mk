PRODUCT_BRAND ?= NucleaRom

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/nr/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/nr/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/nr/prebuilt/common/bin/50-nr.sh:system/addon.d/50-nr.sh \
    vendor/nr/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/nr/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Lineage-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/nr/config/permissions/nr-sysconfig.xml:system/etc/sysconfig/nr-sysconfig.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/nr/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/nr/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/nr/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/nr/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Copy all nr-specific init rc files
$(foreach f,$(wildcard vendor/nr/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/nr/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is nr (Based On LineageOS)!
PRODUCT_COPY_FILES += \
    vendor/nr/config/permissions/org.lineageos.android.xml:system/etc/permissions/org.lineageos.android.xml \
    vendor/nr/config/permissions/privapp-permissions-lineage.xml:system/etc/permissions/privapp-permissions-lineage.xml

# Include nr audio files
include vendor/nr/config/nr_audio.mk

ifneq ($(TARGET_DISABLE_LINEAGE_SDK), true)
# Lineage SDK
include vendor/nr/config/lineage_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/nr/config/twrp.mk
endif

# Boot animation include
PRODUCT_BOOTANIMATION := vendor/nr/bootanimation/bootanimation.zip
PRODUCT_COPY_FILES += \
vendor/nr/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Required Lineage packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LineageParts \
    Development \
    Profiles

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom Lineage packages
PRODUCT_PACKAGES += \
    AudioFX \
    LineageSettingsProvider \
    LineageSetupWizard \
    Eleven \
    ExactCalculator \
    Jelly \
    LockClock \
    Trebuchet \
    Updater \
    WallpaperPicker \
    WeatherProvider \
    LOSCoins

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Berry styles
PRODUCT_PACKAGES += \
    LineageDarkTheme \
    LineageBlackAccent \
    LineageBlueAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageGreenAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageYellowAccent

# Extra tools in nr
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
PRODUCT_PACKAGES += \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.lineage
endif

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

DEVICE_PACKAGE_OVERLAYS += vendor/nr/overlay/common

# NR_BUILDTYPE belongs to the nr.mk
ifeq ($(NR_BUILDTYPE), Official)
    NR_TAG := Official
else ifeq ($(NR_BUILDTYPE), Alpha)
    NR_TAG := Alpha
else ifeq ($(NR_BUILDTYPE), Beta)
    NR_TAG := Beta
else ifeq ($(NR_BUILDTYPE), Test)
    NR_TAG := Test
else ifeq ($(NR_BUILDTYPE), EOL)
    NR_TAG := EOL
else
    NR_TAG := Unofficial
endif

# Include versioning information
# Format: Major.minor.maintenance(-TAG)
NR_VERSION_TAG := 8.1-1
export NR_VERSION := $(NR_VERSION_TAG)-$(NR_TAG)
ROM_POSTFIX := $(shell date -u +%Y%m%d)

export NR_BUILD_VERSION := NucleaRom-$(NR_VERSION)-$(TARGET_PRODUCT)-$(ROM_POSTFIX)
export ROM_VERSION := $(NR_VERSION)-$(ROM_POSTFIX)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.modversion=$(NR_BUILD_VERSION) \
    ro.nr.buildtype=$(NR_BUILDTYPE) \
    ro.nr.version=$(NR_VERSION) \
    ro.lineagelegal.url=https://lineageos.org/legal

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(NR_BUILD_VERSION) \
    ro.nr.buildtype=$(NR_BUILDTYPE) \
    ro.nr.version=$(NR_VERSION) 

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/nr/build/target/product/security/nr

-include vendor/lineage-priv/keys/keys.mk

NR_DISPLAY_VERSION := $(NR_BUILD_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.nr.display.version=$(NR_DISPLAY_VERSION)

# Fonts
PRODUCT_COPY_FILES += \
    vendor/nr/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/nr/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/nr/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/nr/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/nr/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/nr/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf 

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/nr/config/partner_gms.mk
-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
