
import 'package:get/get.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/orders_model.dart';
import 'package:http/http.dart' as http;

class OrderSuccessController extends GetxController {


RxBool isLoading = true.obs;
 void onInit() async{
     Securestorage storage = new Securestorage();
      
      Url.Token_user = await storage.read('token_user');

      Url.saved_id_user = await storage.read('id_user');
    if(Url.Token_user == ""){
      print("token is null");

    }
    else {
      print("hi token ");
      print(Url.Token_user);
      Securestorage storage = new Securestorage();
      

      Url.Token_user = await storage.read('token_user');

      Url.saved_id_user = await storage.read('id_user');
    GetOrders();
    }
    super.onInit();
    
  }

Myorders orders=new Myorders(orders: []);
 Future<void> GetOrders() async {
    try {
      // print("token ====${Url.Token_user}");
      // print("${Url.domain}/customer/loyalty/transactions");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}',
      };
      var request = http.Request(
        'GET',
       
        Uri.parse("${Url.domain}/customer/my-orders")
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value=false;
        print("yesss gettransaction");
        print(response.statusCode);
        print(responseBody);
        orders=myordersFromJson(responseBody);
        // isLoading.value = false;
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        
      } else {
        print(responseBody);
        print(response.statusCode);
        print("noo  gettransaction");
      //  isLoading.value = false;
      }
    } catch (e) {
      print(e);
      //  isLoading.value = false;
      
    }
  }
}