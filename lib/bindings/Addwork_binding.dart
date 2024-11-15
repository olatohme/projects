


import 'package:get/get.dart';
import 'package:new_proj/controller/addwork_controller.dart';




class addworkbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AddWorkController());

  }

}
