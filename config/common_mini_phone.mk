# Inherit mini common nr stuff
$(call inherit-product, vendor/nr/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/nr/config/telephony.mk)
