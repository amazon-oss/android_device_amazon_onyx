#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/onyx

# Boot Image
BOARD_BOOTIMG_HEADER_VERSION := 1

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := onyx

# Display
TARGET_SCREEN_DENSITY := 213

# Kernel
TARGET_KERNEL_ADDITIONAL_CONFIG := onyx.config

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_PARTITION_SIZE := 234881024

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt8168

# Verified Boot
BOARD_AVB_ENABLE := false

# Inherit from mt8168-common
include device/amazon/mt8168-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/amazon/onyx/BoardConfigVendor.mk
