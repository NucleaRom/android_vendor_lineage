# Inherit full common nr stuff
$(call inherit-product, vendor/nr/config/common_full.mk)

PRODUCT_PACKAGES += TvSettings

DEVICE_PACKAGE_OVERLAYS += vendor/nr/overlay/tv
