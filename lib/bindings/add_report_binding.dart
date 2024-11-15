


import 'package:get/get.dart';
import '../controller/add_report_controller.dart';


class AddReportBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AddReportControoler());

  }

}
