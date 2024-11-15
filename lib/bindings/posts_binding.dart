import 'package:get/get.dart';

import '../controller/posts_controller.dart';


class PostsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<PostController>(PostController());
  }

}
