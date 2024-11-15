


import 'package:get/get.dart';

import '../controller/providers_controller.dart';







class providerbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ProvidersController());

  }

}
