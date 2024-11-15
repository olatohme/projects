
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/storage.dart';
import 'dart:convert';
import '../consts/url.dart';
import '../models/profile_provider_model.dart';

class ProfileProviderController extends GetxController {
  // var isLoading = true.obs;
  // var provider = ProfileProviderModel(id: 0, name: '', email: '', phone: '', imageUrl: '').obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchProfileProvider();
  // }
  //
  // void fetchProfileProvider() async {
  //   try {
  //     print("in fetch profile provider ");
  //     isLoading(true);
  //     var response = await http.get(
  //       Uri.parse('${Url.domain}/provider/my-profile'),
  //       headers: {
  //         'Authorization': 'Bearer ${Url.Token_prov}',
  //       },
  //     );
  //     var jsonResponse = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //
  //       provider.value = ProfileProviderModel.fromJson(jsonResponse);
  //       print("in fetch profile provider 200");
  //     } else {
  //       EasyLoading.showError(jsonResponse);
  //       Get.snackbar('Error', 'Failed to load user profile');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   } finally {
  //     isLoading(false);
  //   }
  // }



  var profile = Profile(id: 0, name: '', email: '', phone: '', is_active: 0,profileImageUrl: '').obs;
  var isLoading = true.obs;

  @override
  void onInit() async{
    if(Url.Token_prov!=""){await fetchProfileProvider();}
    
    super.onInit();
    
  }

  Future fetchProfileProvider() async {
       Securestorage storage=new Securestorage();
                                    // await storage.delete('token_provider');
      String token_regester=await storage.read('token_prov_reg') ;
      String token_login=await storage.read('token_provider') ;
     

   
      print('id providerrrr${Url.saved_id_prov_reg}');
      isLoading(true);
       
      if(token_login!=""){ 
         try {
        
        final response = await http.get(
        
        Uri.parse('${Url.domain}/provider/profile/${Url.saved_id_prov}'),
      );
           if (response.statusCode == 200) {
        print(response.body);
        var data = json.decode(response.body);
        profile.value = Profile.fromJson(data['profile']);
        print( "Activeeee${profile.value.is_active}");
      } else {
        Get.snackbar('Error', 'Failed to fetch profile');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
      }

      else{ 
         try {
        final response = await http.get(
        
        Uri.parse('${Url.domain}/provider/profile/${Url.saved_id_prov_reg}'),
      );
       if (response.statusCode == 200) {
        print(response.body);
        var data = json.decode(response.body);
        profile.value = Profile.fromJson(data['profile']);
        print( "Activeeee${profile.value.is_active}");
      } else {
        Get.snackbar('Error', 'Failed to fetch profile');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
      }

      // final response = await http.get(
        
      //   Uri.parse('${Url.domain}/provider/profile/${Url.saved_id_prov}'),
      // );

 
  }


}
