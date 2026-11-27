#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common@4.0-util-v28 \
    android.hardware.audio.effect@4.0-impl \
    audio.a2dp.default \
    audio.primary.amazon_wrapper_v28 \
    audio.r_submix.default \
    audio.usb.default \
    fireos.hardware.audio.service \
    libalsautils \
    libamazonlog \
    libeffects \
    libtinycompress \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Dalvik
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Dolby
include hardware/amazon/AmazonDolby/dolby.mk

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service.onyx \
    libkeymaster_messages.vendor

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt8168:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt8168 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt8168:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt8168

PRODUCT_PACKAGES += \
    init.onyx.rc

# Screen
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml

# Shims
PRODUCT_PACKAGES += \
    libbase_shim \
    libswdap_shim

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from mt8168-common
$(call inherit-product, device/amazon/mt8168-common/mt8168.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/onyx/onyx-vendor.mk)
