import 'package:get/get.dart';
import 'package:new_proj/controller/contact_controller.dart';







class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }
}
