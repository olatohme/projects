


import 'package:get/get.dart';

import '../controller/tasks_controller.dart';


class tasksbinding implements Bindings{
  @override
  void dependencies() {
    Get.put(TasksController());

  }

}
