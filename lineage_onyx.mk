#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device makefile.
$(call inherit-product, device/amazon/onyx/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_onyx
PRODUCT_DEVICE := onyx
PRODUCT_MANUFACTURER := Amazon
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := KFONWI

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.product.manufacturer=AMAZO

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="roselite-user 16 SL16SHIP2003 1344N amz-p,release-keys"

BUILD_FINGERPRINT := Amazon/roselite/roselite:16/SL16SHIP2003/1344N:user/amz-p,release-keys
