


import 'package:get/get.dart';

import '../controller/login_controller.dart';


class loginbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(loginController());

  }

}
