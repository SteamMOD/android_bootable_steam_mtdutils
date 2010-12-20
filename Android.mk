ifneq ($(TARGET_SIMULATOR),true)
ifeq ($(TARGET_ARCH),arm)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os

LOCAL_SRC_FILES := \
	mtdutils.c \
	mounts.c

LOCAL_MODULE := libsteam_mtdutils

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := flash_image.c
LOCAL_MODULE := steam_flash_image
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils
LOCAL_SHARED_LIBRARIES := libcutils libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := dump_image.c
LOCAL_MODULE := steam_dump_image
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils
LOCAL_SHARED_LIBRARIES := libcutils libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := erase_image.c
LOCAL_MODULE := steam_erase_image
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils
LOCAL_SHARED_LIBRARIES := libcutils libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := flash_image.c
LOCAL_MODULE := libsteam_flash_image
LOCAL_CFLAGS += -Dmain=steam_flash_image_main
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := dump_image.c
LOCAL_MODULE := libsteam_dump_image
LOCAL_CFLAGS += -Dmain=steam_dump_image_main
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := erase_image.c
LOCAL_MODULE := libsteam_erase_image
LOCAL_CFLAGS += -Dmain=steam_erase_image_main
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := dump_image.c
LOCAL_MODULE := steam_utility_dump_image
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_STEM := dump_image
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils libcutils libc
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := flash_image.c
LOCAL_MODULE := steam_utility_flash_image
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_STEM := flash_image
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils libcutils libc
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Os
LOCAL_SRC_FILES := erase_image.c
LOCAL_MODULE := steam_utility_erase_image
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_STEM := erase_image
LOCAL_STATIC_LIBRARIES := libsteam_mtdutils libcutils libc
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

endif	# TARGET_ARCH == arm
endif	# !TARGET_SIMULATOR
