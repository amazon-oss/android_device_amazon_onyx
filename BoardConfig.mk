#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/onyx

# Inherit from mt8168-common
include device/amazon/mt8168-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/amazon/onyx/BoardConfigVendor.mk
