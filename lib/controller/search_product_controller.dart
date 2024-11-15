import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:new_proj/models/category_model.dart';
import 'dart:convert';
import '../consts/url.dart';



class SearchProductController extends GetxController {
  var name='';
  var isclick=true.obs;
  var isLoading = true.obs;
  var productList = <product>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
  void fetchSearchProduct() async {
    final response = await http.get(
      Uri.parse('${Url.domain}/api/v1/collection/search-product?query=${name}'),
      headers: {

      },
    );
    print ("ppppppppppppp");
    if (response.statusCode == 200) {
      print ("200");
      var data = json.decode(response.body);
      if (data['products'] != null) {
        print ("[[[[[[[[[[[[[[[[");
        productList.value = (data['products'] as List)
            .map((productJson) => product.fromJson(productJson))
            .toList();
      }
    } else {
      print ("pppppppppp");
      // Handle error
      print('Failed to load products');
    }
    isLoading.value = false;
  }

}
