import 'package:get/get.dart';

import '../controller/search_provider_controller.dart';

class SearchProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchProviderController());
  }
}
