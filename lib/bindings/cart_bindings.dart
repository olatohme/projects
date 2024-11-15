


import 'package:get/get.dart';


import '../controller/cart_controller.dart';



class cartbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CartController());

  }

}
