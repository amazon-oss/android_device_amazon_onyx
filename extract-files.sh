#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/bin/rpmb_svc)
            sed -i "s|/dev/block/mmcblk0rpmb|/dev/mmcblk0rpmb\x00\x00\x00\x00\x00\x00|" "${2}"
            ;;
        vendor/lib/hw/audio.primary_amazon.mt8168.so)
            "${PATCHELF}" --set-soname "audio.primary_amazon.mt8168.so" "${2}"
            ;;
        vendor/lib/hw/fireos.hardware.audio@4.0-impl.so|vendor/lib/libaudioprimarydevicehalifclient.so)
            "${PATCHELF}" --replace-needed "android.hardware.audio.common@4.0-util.so" "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib/libbessound_hd_mtk_vendor.so|vendor/lib/libcvsd_mtk.so|vendor/lib/libmsbc_mtk.so|vendor/lib/libmtklimiter_vendor.so|vendor/lib/libmtkshifter_vendor.so)
            "${PATCHELF}" --add-needed "liblog.so" "${2}"
            ;;
        vendor/lib/libcam.feature_utils.so|vendor/lib/libcam.iopipe.so|vendor/lib/libfeature.face.so|vendor/lib/libimageio_plat_drv.so|vendor/lib/libmtkcam.featurepipe.capture.so|vendor/lib/libmtkcam.featurepipe.streaming.so|vendor/lib/libmtkcam.featurepipe.vsdof_util.so|vendor/lib/libmtkcam_3rdparty.mtk.so|vendor/lib/libmtkcam_3rdparty.so|vendor/lib/libmtkcam_hwnode.so)
            "${PATCHELF}" --replace-needed "libdpframework.so" "libdpframework_compat.so" "${2}"
            ;;
        vendor/lib/libcam3a_imem.so|vendor/lib/libcamdrv.so|vendor/lib/libmtkcam_imgbuf.so)
            "${PATCHELF}" --add-needed "libion_mtk_compat.so" "${2}"
            sed -i "s/\x00ion_custom_ioctl\x00/\x00ion_compat_ioctl\x00/" "${2}"
            ;;
        vendor/lib/libnvram.so)
            "${PATCHELF}" --add-needed "libbase_shim.so" "${2}"
            ;;
        vendor/lib/soundfx/libswdap.so)
            "${PATCHELF}" --add-needed "libswdap_shim.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=onyx
export DEVICE_COMMON=mt8168-common
export VENDOR=amazon

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
