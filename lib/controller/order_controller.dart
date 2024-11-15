import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/addition_model.dart';

import 'package:new_proj/models/bouqets_model.dart';
import 'package:new_proj/models/boxes_model.dart';

import 'package:new_proj/models/colors_model.dart';
import 'package:new_proj/models/flowers_model.dart';
import 'package:new_proj/consts/storage.dart';

class OrderController extends GetxController {

bool choose_box= false;
bool choose_color= false;
Boxes box=Boxes(boxes: []);
List<ColorsList> colors =[];
 List<String> numbers = [];
 List<int> result = [];
Flowers flowers=Flowers(products: []);
Addition_a  addition=Addition_a (additions: []);
List<Product_flo> products =[];
List<int> quantities_flower =[];
List<int> quantities_addition =[];
RxInt quantity_flower=1.obs;
RxInt quantity_addition=1.obs;
String size="";
List<AdditionElement> addition_create=[];
Bouquets bouqets =Bouquets(bouquets: []);
String name="birthday Bouqet";
RxBool isLoading_bouq = true.obs;

RxBool isDialogOpen=false.obs;
RxBool isDialogbouket=false.obs;
RxBool order_load=true.obs;
RxInt current_size=5.obs; 
RxInt current_b= 100.obs;
RxInt current_c=100.obs;
int status_color=0;
int status_flower=0;
int status_box=0;
int status_addtocart=0;
// int quantity=1;
int box_id=0;
int color_id=0;
  
  List<int> extractRgbValues(String rgbString) {
  // استخدام تعبير منتظم لاستخراج الأرقام بين الأقواس
  final regex = RegExp(r'\d+');
  // مطابقة الأرقام في السلسلة النصية
  final matches = regex.allMatches(rgbString);
  
  // تحويل الأرقام من سلسلة نصية إلى أرقام صحيحة
  return matches.map((match) => int.parse(match.group(0)!)).toList();
}

List<int> getcolor(int index){
    
  
     List<int> result = extractRgbValues(bouqets.bouquets[index].color.rgbCode);
    return result;

}
@override
  void onInit() async{
    super.onInit();
    if(Url.Token_user == ""){
      print("token is null");
     
      }
      else{
        print( Url.Token_user);
         Securestorage storage=new Securestorage();
                                
    Url.Token_user =(await storage.read('token_user')) ;
     print( Url.Token_user);
     await order();
      }
    
  }
   

   Future order() async{
  print("orderrrr");
 box=(await GetBoxes());
      colors=(await GetColors());
      flowers=(await GetFlowers());
      addition=(await GetAddition());
      bouqets=(await GetAllBouqets());
      current_b= 100.obs;
      current_c=100.obs;
      order_load.value=false;

   }
 
   Future<Boxes> GetBoxes () async {
    print("Getttttttttt");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
    
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/customer/designs")
      );
      

      request.headers.addAll(headers);
     
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
     
      status_box= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getbox");
         
        print(response.statusCode);
    
        print(responseBody);
        
        return boxesFromJson(responseBody);
        
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        
        
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getbox");
        return box;
      }
    } catch (e) {
      print(e);
      return box;
    }
  }

  Future<List<ColorsList>> GetColors () async {
    print("Getttttttttt");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
    
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/customer/colors")
      );
      

      request.headers.addAll(headers);
     
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
     
      status_color= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getcolor");
         
        print(response.statusCode);
    
        print(responseBody);
        
        colors = colorsListFromJson(responseBody);
        
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return colors;
        
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getcolor");
        return colors;
      }
    } catch (e) {
      print(e);
      return colors;
    }
  }

  Future<Flowers> GetFlowers () async {
    print("Getttttttttt");
    try {
      var headers = {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${Url.Token_user}'
      };
    
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/api/v1/product/all-products")
      );
      

      request.headers.addAll(headers);
     
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
     
      status_flower= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getflower");
         
        print(response.statusCode);
    
        print(responseBody);
        
        flowers = flowersFromJson(responseBody);
        
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return flowers;
        
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getflower");
        return flowers;
      }
    } catch (e) {
      print(e);
      return flowers;
    }
  }

 Future<Addition_a> GetAddition () async {
    print("Getttttttttt");
    try {
      var headers = {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${Url.Token_user}'
      };
    
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/api/v1/all-additions")
      );
      

      request.headers.addAll(headers);
     
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
     
      status_flower= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("yesss getaddition");
         
        print(response.statusCode);
    
        print(responseBody);
        
        addition = additionFromJson(responseBody);
        
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return addition;
        
      } else {
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getaddition");
        return addition;
      }
    } catch (e) {
      print(e);
      return addition;
    }
  }


  Future<Bouquets> GetAllBouqets () async {
    print("Getttttttttt");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
    
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/customer/custom-bouquets")
      );
      

      request.headers.addAll(headers);
     
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
     
      status_flower= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
         isLoading_bouq.value = false;
        print("yesss getbouqets");
         
        print(response.statusCode);
    
        print(responseBody);
        
        bouqets = bouquetsFromJson(responseBody);
        
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return bouqets;
        
      } else {
         isLoading_bouq.value = false;
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        print(responseBody);
        print(response.statusCode);
        print("noo getbouqets");
        return bouqets;
      }
    } catch (e) {
       isLoading_bouq.value = false;
      print(e);
      return bouqets;
    }
  }

Future Create_bouqet( ) async {
   
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('${Url.domain}/customer/custom-bouquet'));
      request.fields.addAll({
        'name' :name,
        'design_id': "${box_id}",
        'color_id': "${color_id}"
      });
        for (int i = 0; i < products.length; i++) {
          request.fields.addAll({
        'products[${i}][product_id]': '${products[i].id}',
        'products[${i}][quantity]': '${quantities_flower[i]}',
        'products[${i}][size][]' :'${size}'
      });
        }
        if( addition_create.length>0){
          for (int i = 0; i < addition_create.length; i++) {
          request.fields.addAll({
        'additions[${i}][addition_id]': '${addition_create[i].id}',    
        'additions[${i}][quantity]': '${quantities_addition[i]}',
      });
        }}
         
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_addtocart = response.statusCode;
      print(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        
       
        print(response.statusCode);
        print("okkkkk create");
        EasyLoading.showSuccess("Successfully create bouqet ");
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk create");
        print(response.request); 
        print(jsonDecode(responseBody)['message']);
         EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
       EasyLoading.showError(e.toString());
    }
  }


  Future Add_bouqetToCart() async {
   
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('${Url.domain}/customer/cart/bouquet'));
      request.fields.addAll({
       
        'bouquet_id': "${Url.idBouqet}",
        
      
      });
   
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_addtocart = response.statusCode;
      print(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
       
        
        print(response.statusCode);
        print("okkkkk add");
         EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk add");
        print(response.request); 
         EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
       EasyLoading.showError(e.toString());
    }
  }
}


