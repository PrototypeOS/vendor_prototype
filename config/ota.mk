ifeq ($(LIGHTHOUSE_BUILD_TYPE), OFFICIAL)

LIGHTHOUSE_OTA_VERSION_CODE := ranch

PRODUCT_GENERIC_PROPERTIES += \
    ro.lighthouse.ota.version_code=$(PROTOTYPE_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

endif
