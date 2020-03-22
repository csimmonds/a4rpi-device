
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Enable Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet

# Screen density (default is 0)
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=160

# Specify OpenGLES version
# 131072 = 2.0
# 196608 = 3.0
# 196609 = 3.1
# 196610 = 3.2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# RPi3 only has 1GiB RAM (768 MiB available to the CPU)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true

# Set factory reset protection (frp) to a persistent data block stored in an mmc partiton
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/soc/3f202000.mmc/by-name/frp

## Use swiftshader Open GL libraries
#PRODUCT_PACKAGES += \
#    libEGL_swiftshader \
#    libGLESv1_CM_swiftshader \
#    libGLESv2_swiftshader \
#    libyuv

# Mesa OpenGL + drm hw composer and drm gralloc
PRODUCT_PACKAGES += \
    libGLES_mesa \
    gralloc.rpi3

PRODUCT_PROPERTY_OVERRIDES += \
    gralloc.drm.device=/dev/dri/card0			      

# Prevent hwui from overloading hwcomposer.drm: remove when drm_hwc is fixed
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_partial_updates=0

# kernel
PRODUCT_COPY_FILES += $(LOCAL_PATH)/zImage:kernel

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.rpi3 \
    audio.usb.default

# Init scrips, etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.rpi3:root/fstab.rpi3 \
    $(LOCAL_PATH)/init.rpi3.rc:root/init.rpi3.rc \
    $(LOCAL_PATH)/ueventd.rpi3.rc:root/ueventd.rpi3.rc

# Audio config
PRODUCT_COPY_FILES += \
    device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:vendor/etc/audio_effects.conf \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:vendor/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:vendor/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.rpi3

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service.rpi3 \
    android.hardware.graphics.mapper@2.0-impl.rpi3 \
    android.hardware.graphics.composer@2.1-impl.rpi3 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.rpi3

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-impl \
    android.hardware.usb@1.0-service

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \

# Getkeeper (performs device pattern/password authentication in a Trusted Execution Environment (TEE)
# https://source.android.com/security/authentication/gatekeeper
PRODUCT_PACKAGES += \
    gatekeeper.rpi3 \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/rpiorg/rpi3/prebuilt/vendor,vendor)

# Media codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:vendor/etc/media_codecs_google_video.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:vendor/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml

# Need AppWidget permission to prevent Launcher[2|3] crashing
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

