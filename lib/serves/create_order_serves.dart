import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/create_order_controller.dart';

import 'package:new_proj/models/create_order_model.dart';
import 'package:new_proj/models/price_model.dart';

class create_order_serves{
 
  var url=Uri.parse(Url.domain+Url.createorder);
  var error='';
  var message;

  // int order_id=0;
  
  Future<bool> createorderr(create_order cc,String token )async{
print(token);
print("user idddiddd===${Url.id_user}");
print("user idddidddsavve===${Url.saved_id_user}");
print(cc.payment_methode);
    print(url);
print(cc.delivery_to);
var response= await http.post(
      url,
      headers: {
        'Accept':'application/json',
        'Authorization': 'Bearer ${Url.Token_user}',
      },
      body: {

        'notes':cc.notes,
        'payment_method':cc.payment_methode ,
        'shipping_method':cc.shipping_method,
       'delivery_to':cc.delivery_to,
        'user_id':'${Url.saved_id_user}',

      },
    );
  
    print('jj');
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
    
      message='success';
      var responsejson=jsonDecode(response.body);
      Url.order_id=responsejson['order']['order_id'];
      Url.totalprice=responsejson['order']['total_price'];
      print( "price ${Url.totalprice}");
     
      // print("orderrrr ${order_id}");
      /*  if(checkbox){
        securestorsge storage=new securestorsge();
        await  storage.save('token', userinformation.usertoken);
      }*/ 

      return true;
    }
    else if(response.statusCode==401){
      var responsejson=jsonDecode(response.body);
      error=responsejson['message'];
      print(error);
      return false;

    }
    else{
      var responsejson=jsonDecode(response.body);
      error=responsejson['message'];
      //   print(error);

      return false;
    }
  }





  var message2;
  var url2=Uri.parse(Url.domain+Url.getprice);
  Future<Temperatures>  getprice( String token) async{
    print(url2);
    token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTQ4MWRhM2M5NmI5ZDhjZmY4OTRhODdmODZkMDE0M2NlZmY5YTIyYWFjNmZkODEzMTI2MTUzNDU0YzY1MzU0NjEzNTk3N2Y2MzI5ZjZiM2YiLCJpYXQiOjE3MTQ4OTQyMzYuMjUxMzgzLCJuYmYiOjE3MTQ4OTQyMzYuMjUxMzg2LCJleHAiOjE3NDY0MzAyMzYuMjIzNDc2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.eSfQ2c5DGH5D2S0tBlz_UsmiXN0jPlCCJxY15BuSu2_r6q4oC5ibM6HU25tF5T9fDcsZPX3mqPAjjwc6Fu1n7cu32D-WnCFclBuaeSc3oh2FIcedaQBArhZKHJnVp1y1G9mM_I014tFp9XVYFhURP0ICmUInoziD56Q50BMctN3MqjJZOWCfokoR9y7xg4t10othS6dlHTjdgl9f0lspmXEKyQ-ZxUS20bHA9jGQ8yE2hwVS_C7IOSOYR_GDoeuP9hcZXw0Ph_PIYpH7LoVA4GyYvUWESV3PBmG2xgp5aqpr5e79Tttau6v2Fdk9KDUbEKC8c8hnGbtuhsjAZOp9K7mso8AcNUDV_f-1LCiBmgQW4wFnyOCXY7jIqDKA6kVdFhl6qfahC0IAFMadV1PeFvizNt3YCfPdn59lAYvKzH4slKrDHcf9Xvfq9xHUi5RK-BaVuF1AjlY-8ii-TpiEv8-nlATXqBb9gqHCog15ronVL8HksiOgWBmOFYae6ARPLGxMrfs7uOYA2r4Vpa4njNLETaa0yzyoj9vdX3UQelMOcA2_JGCSvDBns62HMgLxN5otTiQgK2jP_eq3c2ZndJI5Zm7hFlPOr8OrsNXfRaUhLMXQsrAea2kJyWK5cWobVvgo14CI7o_kDnlVnFf_mZiUWZsoTDE0unJ5MBjeQ_I';
   // token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWQxZjg5M2Q4Y2I4Zjg3NjY4ZDU3ZjU3MjBmODEwNWU4YTc3OGUzZDQzOGI1M2VhMTBmZjc3MDNhNWQ1NmZjMWZiNmI0Y2ZkZDRhZWY4Y2UiLCJpYXQiOjE3MTQ3NzIyNTcuNzMyNTg4LCJuYmYiOjE3MTQ3NzIyNTcuNzMyNTkxLCJleHAiOjE3NDYzMDgyNTcuNjY2OTUxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XfCQQVkOENFpD9Ozyvjj5Yi9cdfrxtvMv7zTZ9hivqzENiQMGOh0iCmtvgtaJ5d3inR6UMJ6tou8rfrm7kuzE4EJ6jdf_yOxKalbkwM6gTzFHk_pthrcOM5wMLd_-7k1Epg03dv4hPcSvRP-xKHfx5242GW-k9_K7oXzKFTeCk4Cxy5lhb2pRFbNSScNBHZ9DE6FhUJINgqw2h6Y6LVios-ic-EYbieZ0DGUn_MHnchXSIC9RHkOE4wsLQF7lWl0si2R6V7Cnbb2h1QHUis5H5Bl6qrjHM79ksCsBGb-MH9pcTme8DVocMj5VJGtioVDIg6D7MO9X27aHBOAxy9Nv1c2fm5wserwNIu1T489pmow__TR-XtvogFCA1WF8FHBStiho9t3og3DlVeHXg3Y3AtQ3qILFlp7kanS0i8DLtPfUjqz00eXHoc9q6ISgrVzfZ0xEQbDm1XP-MisimdTR-xhGSglrZf4vZrlXtGNlNU31eibjCzQztC1l1HscawPuz3FSIbb7bwBnE1PexyH5Li-55qYYGTLonaHuJaBPChiFKc_oPFi3kkkTMMX3x6PZakaPvfwea0jvd7IX9jMLprQ0QPc3uXXzv3OOrEfRo2gPVWIO6F8jp9Ye59SLTQPF0kELEp68GgYaH9AXXbV7tphgQdJMnI9sUbPqZoaxCs";
    var response=await http.get(url2,headers: {
      'Accept':'application/json',
      'Authorization': 'Bearar ${token}',
    });
    print("ff");
    print(response.body);
    print(response.statusCode);

    if(response.statusCode==200){
      //    var jsonresponse=jsonDecode(response.body);
      var price=priceFromJson(response.body);
      print(response.body);
      return  price;
    }
    else
      return Temperatures(success: '', price: 0);



  }

}