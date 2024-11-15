import 'package:get/get.dart';
import 'package:new_proj/controller/show_provider_controller.dart';

class ShowProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowProviderController>(() => ShowProviderController());
  }
}
