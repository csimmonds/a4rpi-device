# Ensure that sub packages are only built for RaspberryPi
# Note: TARGET_DEVICE is rpi3
#       TARGET_PRODUCT = aosp_rpi3

ifneq ($(filter rpi3, $(TARGET_DEVICE)),)
    LOCAL_PATH := $(call my-dir)
    include $(call all-makefiles-under,$(LOCAL_PATH))
endif

