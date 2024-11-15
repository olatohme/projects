
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/transaction_controller.dart';
import 'package:new_proj/models/profile_user_model.dart';
import 'dart:convert';

import '../consts/storage.dart';

class ProfileUserController extends GetxController {

  var controller = Get.find<TransactionController>();
  var profile = Profile(id: 0, name: '', email: '', phone: '', image: '').obs;
  var isLoading = true.obs;

  @override
  void onInit() async{
    Securestorage storage = new Securestorage();
      // await storage.delete('token_provider');

      Url.Token_user = await storage.read('token_user');

      Url.saved_id_user = await storage.read('id_user');
    if(Url.Token_user == ""){
      print("token is null");

    }
    else {
      print("hi token ");
      print(Url.Token_user);
      Securestorage storage = new Securestorage();
      // await storage.delete('token_provider');

      Url.Token_user = await storage.read('token_user');

      Url.saved_id_user = await storage.read('id_user');
      print("token user  ${Url.Token_user}");
      print("token user  ${  Url.saved_id_user}");
       print("hi 55555 token ");
       await controller.GetPoints();
      await getUserProfile();
    }
    super.onInit();
  }

  Future getUserProfile() async {

    try {
      isLoading(true);
      final response = await http.get(

        Uri.parse('${Url.domain}'+'/customer/customer/profile/'+'${Url.saved_id_user}'),
      );
       print("hi1111 token ");
      print('${Url.domain}'+'/customer/customer/profile/'+'${Url.saved_id_user}');
      if (response.statusCode == 200) {
         print("hi 6666 token ");
        var data = json.decode(response.body);
        print(data);
        profile.value = Profile.fromJson(data['profile']);
      } else {
        Get.snackbar('Error', 'Failed to fetch profile');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }


}
