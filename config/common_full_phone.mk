# Inherit full common Xtended stuff
$(call inherit-product, vendor/prototype/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/prototype/config/telephony.mk)
