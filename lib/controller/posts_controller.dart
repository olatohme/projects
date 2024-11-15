import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:new_proj/models/post_model.dart';
import '../consts/url.dart';

class PostController extends GetxController {
  // var posts = <Post>[].obs;
  // var isLoading = true.obs;
  //
  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
  //
  // void fetchPosts() async {
  //   try {
  //     isLoading(true);
  //     final response = await http.get(
  //       Uri.parse('${Url.domain}/provider/get-post'),
  //       headers: {
  //         'Authorization': 'Bearer ${Url.Token_prov}'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       var postList = data['posts'] as List;
  //       posts.value = postList.map((post) => Post.fromJson(post)).toList();
  //     } else {
  //       Get.snackbar('Error', 'Failed to fetch posts');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to fetch posts');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  var profile = Profile(
    id: 0,
    name: '',
    email: '',
    phone: 0,
    profileImageUrl: '',
    posts: [],
  ).obs;

  var isLoading = false.obs;

  void fetchPosts() async {
    isLoading(true);
    try {
      print('id is ${Url.show_id_provider}');
      final response = await http.get(
        Uri.parse('${Url.domain}/provider/profile/${Url.show_id_provider}'),
        headers: {
        },
      );

      if (response.statusCode == 200) {
        print("yess posts");
        var data = json.decode(response.body)['profile'];
        profile(Profile.fromJson(data));
      } else {
        print("nooo post");
        Get.snackbar('Error', 'Failed to fetch profile data');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to fetch profile data');
    } finally {
      isLoading(false);
    }
  }
}