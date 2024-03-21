# (C) 2023 RisingOS

# RisingOS versioning

PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/version

DIABLO_VERSION := 1.0
DIABLO_RELEASE_TYPE := INITIAL
DIABLO_CODE := $(DIABLO_VERSION)
DIABLO_MAINTAINER := BUILD_BOT
DIABLO_RELEASE_TYPE := UNOFFICIAL

DIABLO_BUILD_DATE := $(shell date -u +%Y%m%d)

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

# Gapps
ifeq ($(WITH_GMS), true)
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    $(call inherit-product, vendor/gapps/common/Android.mk)
    DIABLO_FLAVOR := UNCHASTE
else
    DIABLO_FLAVOR := VIRGIN
endif

include vendor/lineage/config/version.mk


# Build version
DIABLO_BUILD_VERSION := $(DIABLO_VERSION)-$(DIABLO_RELEASE_TYPE)-$(DIABLO_BUILD_DATE)-$(DIABLO_FLAVOR)--$(CURRENT_DEVICE)

# Display version
DIABLO_DISPLAY_VERSION := $(DIABLO_VERSION)-$(DIABLO_RELEASE_TYPE)-$(DIABLO_PACKAGE_TYPE)-$(DIABLO_FLAVOR)-$(CURRENT_DEVICE)

# RisingOS properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.diablo.maintainer=$(DIABLO_MAINTAINER) \
    ro.diablo.code=$(DIABLO_CODENAME) \
    ro.diablo.packagetype=$(DIABLO_PACKAGE_TYPE) \
    ro.diablo.releasetype=$(DIABLO_RELEASE_TYPE) \
    ro.diablo.version?=$(DIABLO_VERSION) \
    ro.diablo.build.version=$(DIABLO_BUILD_VERSION) \
    ro.diablo.display.version?=$(DIABLO_DISPLAY_VERSION) \
    ro.diablo.platform_release_codename=$(DIABLO_FLAVOR) \
    ro.diablo.device=$(CURRENT_DEVICE) \
    ro.diablo.chipset?=$(DIABLO_CHIPSET) \
    ro.diablo.storage?=$(DIABLO_STORAGE) \
    ro.diablo.ram?=$(DIABLO_RAM) \
    ro.diablo.battery?=$(DIABLO_BATTERY) \
    ro.diablo.display_resolution?=$(DIABLO_DISPLAY)
