#define LOG_TAG "LightHAL"

#include <utils/Log.h>

#include "Light.h"

namespace android {
namespace hardware {
namespace light {
namespace V2_0 {
namespace implementation {

// Methods from ::android::hardware::light::V2_0::ILight follow.
Return<Status> Light::setLight(Type type, const LightState& state) {

    ALOGI("setLight %d", type);
    switch (type) {
        case  Type::BACKLIGHT:
            ALOGI("Setting backlight");
            break;

        default:
        return Status::LIGHT_NOT_SUPPORTED;
    }

    return Status::SUCCESS;
}

Return<void> Light::getSupportedTypes(getSupportedTypes_cb _hidl_cb) {
    ALOGI("getSupportedTypes");
    std::vector<Type> types;

    types.push_back(Type::BACKLIGHT);
    
    _hidl_cb(types);
    return Void();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace light
}  // namespace hardware
}  // namespace android

