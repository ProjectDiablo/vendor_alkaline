#
# Copyright (C) 2023 The risingOS Android Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/prebuilts

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/lineage/overlays

PRODUCT_PACKAGES += \
    SystemUIClocks-BigNum \
    SystemUIClocks-Calligraphy \
    SystemUIClocks-Flex \
    SystemUIClocks-Growth \
    SystemUIClocks-Inflate \
    SystemUIClocks-NumOverlap \
    SystemUIClocks-Weather \
    SystemUIClocks-Metro

# Nothing
PRODUCT_PACKAGES += \
    NothingLauncher3 \
    NothingWeather \
    NothingCardService \
    NothingCardLab \
    libmorpho_MotionSensor \
    libmorpho_rapid_effect_jni
    
PREBUILTS_SOURCE_DIR := vendor/lineage/prebuilts
PREBUILTS_ETC_DEST_DIR := $(TARGET_COPY_OUT_PRODUCT)/etc
PREBUILTS_LIB_SYSTEM_EXT_DEST_DIR := $(TARGET_COPY_OUT_SYSTEM_EXT)/lib64

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(PREBUILTS_SOURCE_DIR)/sysconfig,$(PREBUILTS_ETC_DEST_DIR)/sysconfig) \
    $(call find-copy-subdir-files,*,$(PREBUILTS_SOURCE_DIR)/permissions,$(PREBUILTS_ETC_DEST_DIR)/permissions)

