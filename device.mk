#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from mt8168-common
$(call inherit-product, device/amazon/mt8168-common/mt8168.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/onyx/onyx-vendor.mk)
