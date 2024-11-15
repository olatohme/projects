import 'package:get/get.dart';
import '../controller/profile_provider_controlller.dart';


class ProfileProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProviderController>(() => ProfileProviderController());
  }
}
