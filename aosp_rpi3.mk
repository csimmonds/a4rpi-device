
# Inherit device configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rpi3
PRODUCT_NAME := aosp_rpi3
PRODUCT_BRAND := Raspberry
PRODUCT_MODEL := Raspberry Pi 3
PRODUCT_MANUFACTURER := RaspberryPi.org
PRODUCT_RELEASE_NAME := Raspberry Pi 3
