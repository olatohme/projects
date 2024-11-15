import 'package:get/get.dart';
import 'package:new_proj/controller/my_favorite_controller.dart';


class MyFavoriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MyFavoriteController>(MyFavoriteController());
  }

}
