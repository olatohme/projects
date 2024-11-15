


import 'package:get/get.dart';

import '../controller/add_address_controller.dart';





class addAddressbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AddAddressController());

  }

}
