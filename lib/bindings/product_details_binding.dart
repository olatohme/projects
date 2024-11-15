import 'package:get/get.dart';
import 'package:new_proj/controller/product_details_controller.dart';



class ProductDetails_binding extends Bindings{
  @override
  void dependencies() {
    Get.put<ProductDetails_controller>(ProductDetails_controller());
  }

}
