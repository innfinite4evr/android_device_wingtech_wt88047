#
# Copyright (C) 2015 The Mokee OpenSource Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/wingtech/wt88047

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := HM2014811,HM2014812,HM2014813,HM2014814,HM2014815,HM2014816,HM2014817,HM2014818,HM2014819,HM2014820,HM2014821,HM2014112

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

+# Bootloader
+TARGET_BOOTLOADER_BOARD_NAME :=

# Architecture
ifneq ($(wt88047_32_BIT),true)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
else
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
endif
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

# CPU
TARGET_CPU_CORTEX_A53 := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Kernel
BOARD_CUSTOM_BOOTIMG_MK            := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE += phy-msm-usb.floated_charger_enable=1
TARGET_KERNEL_SOURCE := kernel/wingtech/msm8916
ifneq ($(wt88047_32_BIT),true)
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := mokee_wt88047_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true
endif


# Audio
TARGET_USES_QCOM_MM_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FM := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# MKHW
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/mkhw

# malloc implementation
MALLOC_IMPL := dlmalloc

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Dexopt, only if we can fit that in
ifneq ($(TARGET_TRANSPARENT_COMPRESSION_METHOD),)
ifeq ($(HOST_OS),linux)
    ifeq ($(TARGET_BUILD_VARIANT),user)
        ifeq ($(WITH_DEXPREOPT),)
            WITH_DEXPREOPT := true
        endif
    endif
endif
endif

# Radio
ADD_RADIO_FILES := true
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 335544320
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5939100672

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_F2FS := true

# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Releasetools
ADD_RADIO_FILES := true
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# RIL
TARGET_RIL_VARIANT := caf

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += device/wingtech/wt88047/sepolicy

BOARD_SEPOLICY_UNION += \
    usb_uicc_daemon.te \
    system_server.te \
    wcnss_service.te \
    atfwd.te

# QC PROPRIETARY
ifneq ($(QCPATH),)
BOARD_USES_QCNE := true
endif

# Time services
BOARD_USES_QC_TIME_SERVICES := true

#ODEX
WITH_DEXPREOP := fasle

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

# inherit from the proprietary version
-include vendor/wingtech/wt88047/BoardConfigVendor.mk
