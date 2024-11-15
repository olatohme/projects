
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../consts/url.dart';
import '../models/Show_provider_model.dart';

class ShowProviderController extends GetxController {

  var pro = showProviderModel(
    id: 0,
    name: '',
    email: '',
    phone: '',
    profileImageUrl: '',
    isActive: 2,
  ).obs;


   var prov= showProviderModel(
    id: 0,
    name: '',
    email: '',
    phone: '',
    profileImageUrl: '',
    isActive: 2,
  ).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // showproviderProfiles();
    super.onInit();
  }

  // void showproviderProfile() async {
  //   print("in show");
  //   final response = await http.get(Uri.parse('${Url.domain}/provider/show/${Url.saved_id_prov_reg}'));

  //   if (response.statusCode == 200) {
  //     print(response.statusCode );
  //     print("in show 200");
  //     var jsonData = json.decode(response.body);
  //     print(jsonData );
  //     pro.value = showProviderModel.fromJson(jsonData['provider']);
  //     isLoading.value = false;
  //   } else {
  //     print(response.statusCode );
  //      print("noo show ");
  //     // Handle error
  //     isLoading.value = false;
  //   }
  // }

  Future showproviderProfiles() async {
    print("in show");
    final response = await http.get(Uri.parse('${Url.domain}/provider/show/${Url.show_id_provider}'));

    if (response.statusCode == 200) {
      print(response.statusCode );
      print("in show 200");
      var jsonData = json.decode(response.body);
      print(jsonData );
      prov.value = showProviderModel.fromJson(jsonData['provider']);
      isLoading.value = false;
    } else {
      print(response.statusCode );
      // Handle error
      isLoading.value = false;
    }
  }

}
