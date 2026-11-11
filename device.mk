#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Dalvik
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

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

# Shims
PRODUCT_PACKAGES += \
    libbase_shim

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from mt8168-common
$(call inherit-product, device/amazon/mt8168-common/mt8168.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/onyx/onyx-vendor.mk)
