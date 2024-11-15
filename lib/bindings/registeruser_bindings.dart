


import 'package:get/get.dart';

import '../controller/registeruser_controller.dart';



class registeruserbinding implements Bindings{
  @override
  void dependencies() {
    Get.put<registeruserController>(registeruserController());

  }

}
