import 'dart:async';
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/transaction_model.dart';



import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
 
@override
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
    GetTransaction();
    }
    super.onInit();
    
  }
  List<Transaction> transactions=[];

  int points=0;
  Future<List<Transaction>> GetTransaction() async {
    try {
      print("token ====${Url.Token_user}");
      print("${Url.domain}/customer/loyalty/transactions");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}',
      };
      var request = http.Request(
        'GET',
       
        Uri.parse("${Url.domain}/customer/loyalty/transactions")
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        
        print("yesss gettransaction");
        print(response.statusCode);
        print(responseBody);
        transactions=transactionFromJson(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return transactions;
      } else {
        print(responseBody);
        print(response.statusCode);
        print("noo  gettransaction");
        return transactions;
      }
    } catch (e) {
      print(e);
      return transactions;
    }
  }


  Future<void> GetPoints() async {
    try {
      print("token ====${Url.Token_user}");
      print("${Url.domain}/customer/loyalty");
       final response = await http.get(
        Uri.parse("${Url.domain}/customer/loyalty"),
        headers: {

          'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}',
        },
      );
      
      
      
      if (response.statusCode == 200 || response.statusCode == 201) {
          points = json.decode(response.body)['points'];
        print("yesss getpoints");
        print(response.statusCode);
       
        print(json.decode(response.body));
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        
      } else {
        print(json.decode(response.body));
        print(response.statusCode);
        print("noo  getpoints");
       
      }
    } catch (e) {
      print(e);
     
    }
  }


 

  }