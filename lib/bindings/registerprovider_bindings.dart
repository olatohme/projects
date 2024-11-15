


import 'package:get/get.dart';

import '../controller/register_provider_controller.dart';


class registerproviderbinding implements Bindings{
  @override
  void dependencies() {
    Get.put<registerproviderController>(registerproviderController());

  }

}
