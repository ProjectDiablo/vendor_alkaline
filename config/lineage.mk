include vendor/addons/config.mk
ifeq ($(WITH_GMS), true)
-include vendor/gms/products/gms.mk
endif
include vendor/lineage/config/properties.mk
include vendor/lineage/config/packages.mk
include vendor/lineage/config/vars.mk
include vendor/lineage/config/version.mk
include vendor/lineage/audio/audio.mk
include vendor/lineage/overlays/build.mk
include vendor/lineage/prebuilts/prebuilts.mk
include vendor/lineage/config/common_full_phone.mk
-include vendor/pixeloverlays/config.mk

PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/common

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/lib64/libfuse-lite.so \
    system/lib64/libntfs-3g.so \
    system/lib64/libmorpho_MotionSensor.so \
    system/lib64/libmorpho_rapid_effect_jni.so

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/default-permissions/default_permissions_co.aospa.sense.xml \
    system/etc/permissions/android.hardware.biometrics.face.xml \
    system/etc/permissions/privapp_whitelist_co.aospa.sense.xml \
    system/etc/sysconfig/hiddenapi-whitelist-co.aospa.sense.xml \
    system/lib64/libFaceDetectCA.so \
    system/lib64/libMegviiUnlock-jni-1.2.so \
    system/lib64/libMegviiUnlock.so \
    system/lib64/libmegface.so \
    system/priv-app/FaceUnlock/FaceUnlock.apk

endif
endif

# Dexopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    NexusLauncherRelease \
    NothingLauncher3

# Product Copy
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

ifeq ($(LINEAGE_BUILD),)
# Extracted APN's from Cheetah
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilts/apn/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml
endif

PRODUCT_COPY_FILES += vendor/lineage/prebuilts/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
