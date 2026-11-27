#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=onyx
export DEVICE_COMMON=mt8168-common
export VENDOR=amazon

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
