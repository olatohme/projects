import 'package:get/get.dart';
import 'package:new_proj/consts/url.dart';

import '../models/providers_model.dart';
import 'package:http/http.dart' as http;
class ProvidersController extends GetxController {
int status_prov = 0;
// Providers? prov;
Providers prov=new Providers(providers: []);
 RxBool isLoading = true.obs; 
  
@override
  void onInit() {
    super.onInit();
    GetProviders();
    
  }
  // ignore: non_constant_identifier_names
  Future<Providers> GetProviders() async {
    try {
      var headers = {
        'Accept': 'application/json',
         'Authorization': 'Bearer ${Url.Token_user}'
      };
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/provider/all")
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_prov= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
          isLoading.value = false;
        print("yesss getprov");
        print(response.statusCode);

        prov= providersFromJson(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return prov;
      } else {
         isLoading.value = false;
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getprov");
        return prov;
      }
    } catch (e) {
      print(e);
       isLoading.value = false;
      return prov;
    }
  }
  
}