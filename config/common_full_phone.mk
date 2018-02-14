# Inherit full common nr stuff
$(call inherit-product, vendor/nr/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/nr/overlay/dictionaries

$(call inherit-product, vendor/nr/config/telephony.mk)
