import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/url.dart';

import 'package:new_proj/models/create_order_model.dart';
import 'package:new_proj/models/price_model.dart';
import 'package:new_proj/serves/create_order_serves.dart';

import 'package:http/http.dart' as http;
class Create_Order_Controller extends GetxController {

  Temperatures price = new Temperatures(success: '',price: 0);
  var city = 'Damascus'.obs;
  var points="";
  // var order_id="0";
  // var totalprice="";
  var delivery_to;
  var payment_methode;
  var notes;
  var shipping_methoe;
  var loginstatus;
  var error;
  var token;
  var message;
  var total_price="";
  RxBool isDialogOpen=false.obs;
   RxBool isreplace=false.obs;
  late create_order_serves serves;
  @override
  void onInit() {
    // city = 'Damascus'.obs;
  notes='';
  payment_methode='';
  shipping_methoe='';
  delivery_to='';
  loginstatus=false;
  error='';
  token='';
  message='';
  //  checkboxstatus=false.obs;
  serves=create_order_serves();
  super.onInit();
  }

  @override
  void onReady() async {
   // price = await serves.getprice(userinformation.usertoken);
//print(productlist[0].img_url);

   // isloading(false);
    super.onReady();
  }

  onclickcreate() async{

    create_order co=create_order(payment_methode: payment_methode,notes: notes,
    shipping_method: shipping_methoe,delivery_to: delivery_to);

  loginstatus= await serves.createorderr( co,Url.Token_user);//checkboxstatus.value);
  error=serves.error;
  print(error);

  message=serves.message;
  }


   Future replace_point() async {
    try {
      // print('report   '+report);
      var response = await http.post(
          Uri.parse('${Url.domain}/customer/loyalty/redeem'),
          headers: {
            'Authorization': 'Bearer ${Url.Token_user}',
            'Accept': 'application/json',
          },
          body: {
            'points':points,
            'order_id' : "${Url.order_id}"
          });
      var res = jsonDecode(response.body);
      print(res);
      
      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess("Points successfully redeemed and get a discount of ${res['discount']} \$ ");
        print(response.statusCode);
        print("yess replace");
      } else {
        EasyLoading.showError(res['message']);
        print("noo replace");
        // print(stats_added);
      }
    } catch (e) {
      print("error");
      print("error message   ");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
  }


