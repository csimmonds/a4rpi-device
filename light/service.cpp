#define LOG_TAG "android.hardware.light@2.0-service.rpi3"

#include <hidl/HidlTransportSupport.h>
#include <utils/Log.h>
#include <utils/Errors.h>

#include "Light.h"

// libhwbinder:
using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;

// Generated HIDL files
using android::hardware::light::V2_0::ILight;
using android::hardware::light::V2_0::implementation::Light;

using android::sp;
using android::status_t;
using android::OK;

int main() {

    ALOGI("starting");

    sp<ILight> service = new Light();

    configureRpcThreadpool(1, true);
    status_t status = service->registerAsService();
    if (status == OK) {
        ALOGI("Light HAL Ready");
        joinRpcThreadpool();
        ALOGE("Light HAL failed to join thread pool");
        return 1;
    }

    ALOGE("Cannot register Light HAL service");
    return 1;
}

