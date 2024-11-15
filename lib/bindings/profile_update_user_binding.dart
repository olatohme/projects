
import 'package:get/get.dart';

import '../controller/profile_update_user_controller.dart';


class ProfileUpdateUser_Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileUpdateUser_Controller());
  }
}
