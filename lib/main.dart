import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_proj/controller/notification_controller.dart';
import 'package:new_proj/controller/order_controller.dart';
import 'package:new_proj/controller/order_success_controller.dart';
import 'package:new_proj/controller/profile_user_controller.dart';
import 'package:new_proj/controller/providers_controller.dart';
import 'package:new_proj/controller/transaction_controller.dart';

import 'package:new_proj/routes/routes.dart';

import 'controller/home_controller.dart';
import 'controller/profile_provider_controlller.dart';
import 'controller/search_collection_controller.dart';
import 'controller/search_product_controller.dart';
import 'controller/search_provider_controller.dart';
import 'controller/show_provider_controller.dart';
import 'controller/tasks_controller.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  
  Get.put(ProvidersController());
  Get.put(TasksController());
  Get.put(HomeController());
  Get.put(OrderController());
  Get.put(ShowProviderController());
  Get.put(ProfileProviderController());
  Get.put(SearchProductController());
  Get.put(SearchCollectionController());
  Get.put(SearchProviderController());
  Get.put(TransactionController());
  Get.put(ProfileUserController());
    Get.put(OrderSuccessController());
    Get.put(notificationController());
  


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.Home,
      getPages: AppRoutes.routes,
       builder: EasyLoading.init(),
    );
  }
}
