import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../consts/url.dart';
import '../models/providers_model.dart';


class SearchProviderController extends GetxController {
   var name='';
   var isclick=false.obs;

  var providers = <Provider>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    //fetchProviders();
  }

  void fetchProviders() async {
    isLoading(true);
    try {
      // Replace with your API endpoint
      final response = await http.get(Uri.parse('${Url.domain}/provider/search?query=${name}'));
      if (response.statusCode == 200) {
        print("200 search");
        print(response.body);

        var jsonResponse = json.decode(response.body);
        var providerList = (jsonResponse['providers'] as List).map((providerJson) {
          return Provider.fromJson(providerJson);
        }).toList();
        providers.assignAll(providerList);
        print(providers.length);
      } else {
        // Handle error
        print('Error fetching providers');
      }
    } finally {
      isLoading(false);
    }
  }

}
