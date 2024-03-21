PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/packages

# /system_ext packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    androidx.window.sidecar

PRODUCT_PACKAGES += \
    SystemUIGoogle \
    SettingsGoogle \
    Backgrounds \
    BatteryStatsViewer \
    GameSpace \
    Updater \
    OmniJaws

ifneq ($(WITH_GMS),true)
PRODUCT_PACKAGES += \
    LatinIME
endif
