import 'package:get/get.dart';

class SecurityController extends GetxController {
  // Switch States
  RxBool twoFactorAuth = false.obs;
  RxBool saveLocally = false.obs;
  RxBool biometricUnlock = false.obs;
  RxBool pinEnabled = false.obs;

  // Toggle Functions
  void toggleTwoFactor(bool value) {
    twoFactorAuth.value = value;
    sendToBackend("two_factor_auth", value);
  }



  // Backend API Call
  void sendToBackend(String key, bool value) {
    print("Sending to backend: $key = $value");
  }

  void clearAllSwitches() {
    twoFactorAuth.value = false;
    saveLocally.value = false;
    biometricUnlock.value = false;
    pinEnabled.value = false;

    sendToBackend("two_factor_auth", false);
    sendToBackend("save_locally", false);
    sendToBackend("biometric_unlock", false);
    sendToBackend("pin_enabled", false);
  }

}
