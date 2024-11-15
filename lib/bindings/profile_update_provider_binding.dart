
import 'package:get/get.dart';
import '../controller/profile_update_provider_controller.dart';

class ProfileUpdateProvider_Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileUpdateProvider_Controller());
  }
}
