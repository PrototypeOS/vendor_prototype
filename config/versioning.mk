# Versioning System
PROTOTYPE_BUILD_VERSION = ranch
PROTOTYPE_BUILD_TYPE ?= UNOFFICIAL
PROTOTYPE_VARIANT ?= VANILLA
PROTOTYPE_BUILD_MAINTAINER ?= Spam Dev Moment.
PROTOTYPE_BUILD_DONATE_URL ?= https://www.paypal.me/justing567
PROTOTYPE_BUILD_SUPPORT_URL ?= https://t.me/PROTOTYPEOS_chat

ifeq ($(PROTOTYPE_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat device/official/prototype.devices)
  FOUND_DEVICE =  $(filter $(PROTOTYPE_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(PROTOTYPE_BUILD))
      PROTOTYPE_BUILD_TYPE := OFFICIAL
    else
      PROTOTYPE_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(PROTOTYPE_BUILD)")
    endif
endif

ifeq ($(PROTOTYPE_BUILD_TYPE), OFFICIAL)
    WITH_GAPPS := true
    TARGET_INCLUDE_LIVE_WALLPAPERS=true
    TARGET_INCLUDE_STOCK_GAPPS=true
endif
ifeq ($(WITH_GAPPS), true)
    PROTOTYPE_VARIANT := GAPPS
endif

# Gapps
ifeq ($(WITH_GAPPS), true)
$(call inherit-product, vendor/gapps/config.mk)
endif

# System version
TARGET_PRODUCT_SHORT := $(subst prototype_,,$(PROTOTYPE_BUILD_TYPE))

PROTOTYPE_DATE_YEAR := $(shell date -u +%Y)
PROTOTYPE_DATE_MONTH := $(shell date -u +%m)
PROTOTYPE_DATE_DAY := $(shell date -u +%d)
PROTOTYPE_DATE_HOUR := $(shell date -u +%H)
PROTOTYPE_DATE_MINUTE := $(shell date -u +%M)


PROTOTYPE_BUILD_DATE := $(PROTOTYPE_DATE_YEAR)$(PROTOTYPE_DATE_MONTH)$(PROTOTYPE_DATE_DAY)-$(PROTOTYPE_DATE_HOUR)$(PROTOTYPE_DATE_MINUTE)
PROTOTYPE_BUILD_FINGERPRINT := PrototypeOS/$(PROTOTYPE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(PROTOTYPE_BUILD_DATE)
PROTOTYPE_VERSION := PrototypeOS-$(PROTOTYPE_BUILD_VERSION)-$(PROTOTYPE_BUILD_TYPE)-$(PROTOTYPE_BUILD)-$(PROTOTYPE_BUILD_DATE)-$(PROTOTYPE_VARIANT)

PRODUCT_GENERIC_PROPERTIES += \
  ro.prototype.device=$(PROTOTYPE_BUILD) \
  ro.prototype.version=$(PROTOTYPE_VERSION) \
  ro.prototype.build.version=$(PROTOTYPE_BUILD_VERSION) \
  ro.prototype.build.type=$(PROTOTYPE_BUILD_TYPE) \
  ro.prototype.build.date=$(PROTOTYPE_BUILD_DATE) \
  ro.prototype.build.fingerprint=$(PROTOTYPE_BUILD_FINGERPRINT) \
  ro.prototype.build.maintainer=$(PROTOTYPE_BUILD_MAINTAINER) \
  ro.prototype.build.donate_url=$(PROTOTYPE_BUILD_DONATE_URL) \
  ro.prototype.build.support_url=$(PROTOTYPE_BUILD_SUPPORT_URL)
