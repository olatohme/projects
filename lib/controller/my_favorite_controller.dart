import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/my_favorite _model.dart';
import '../consts/url.dart';
class MyFavoriteController extends GetxController {



  var likedProducts = <LikedProduct>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchLikedProducts();
    super.onInit();
  }
  Future<void> fetchLikedProducts() async {


    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('${Url.domain}'+'/customer/liked-products'),
        headers: {
          'Authorization': 'Bearer ${Url.Token_user}',
               'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("200");
        final List<dynamic> data = json.decode(response.body)['liked_products'];
        likedProducts.value = data.map((item) => LikedProduct.fromJson(item)).toList();
        print(likedProducts.value);
        print(likedProducts.length);
      } else {
        Get.snackbar('Error', 'Failed to fetch liked products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
