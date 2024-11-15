
import 'package:new_proj/consts/url.dart';
import 'package:http/http.dart'as http;
import 'package:new_proj/models/cart_model.dart';



class cartserves{

  var message;
  var url=Uri.parse(Url.domain+Url.getcart);
  Future<MyCart>  getcart( String token) async{
    print(url);
    print(token);
    // token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTlmNmEwODMwYTY0Mzk5ODQyNDIzOGVjNzQzYmZkNjgzNzEwYzViZTAyMGE5ODJhNDkyYzdmYjZkZTZkM2I0MzU1NmFhNWY4NThmOWI1NTEiLCJpYXQiOjE3MTkwNzQyMDguNjg1NzM2LCJuYmYiOjE3MTkwNzQyMDguNjg1NzQ0LCJleHAiOjE3NTA2MTAyMDguNDM3OTU2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.VcotfxBKbzNPwv2S1K4wNXgV0SQZuP32qr_6ChdO6sXeJk71cQTRL4mJ5TD5alCrsujqBNJ0e7_klEqV1s5akN7km7AUis7DVcuk0npMYqwUJhqMSf6jDiLYh1z9WdTOPVAZgG64leAzkRvQpdZY-ei83xQXYEiItDvr95W4FTzPzhn2-cRIpFH1RpKB1ZYxz60kDg1bgRezb8D8DmgoUtjB5DC4WivlsamZds_9mPRJO5OO774loAylFEfLbksZPlDB6BZ-2pj5n4jW0W7WyN2uXtUpD1u4iBhMDY42ltZSoP-bvyzcZ4O-KU9-dy_XxLqJTuMYS_6VQQ3fkR40LEYJJCdPgCcLkcHMwhhHKG9zAv_7o4DuXL9hq712aauFwGJ3BpqJdjE08ToxEVEKd9AW1nIpbjaSTE_l5qvRzZ1tsizhkWt3le--I9n0Rhyo5nZLDKZT-B1_QFhhBDvo-mdUN-JeuIPg893H7eijOT2RD_BcMqKzY-YY7BcbFxYk1XGiUwu5NgLo5UR2joX6Or6oAO63VAID7jsLfsUzmGwxuzbrol0xjyGLS9rpiGtcjM1Xwqg1WkGRKlikWOvQIPnM7GlDfUfPgdaaFKkiQsd_PIq725M-NeWzTfC9O7GVZeZy3gBc8VXQL9-yq_lNjp8OAu9opusdPUcZ3Z0of5w";

  //  token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWQxZjg5M2Q4Y2I4Zjg3NjY4ZDU3ZjU3MjBmODEwNWU4YTc3OGUzZDQzOGI1M2VhMTBmZjc3MDNhNWQ1NmZjMWZiNmI0Y2ZkZDRhZWY4Y2UiLCJpYXQiOjE3MTQ3NzIyNTcuNzMyNTg4LCJuYmYiOjE3MTQ3NzIyNTcuNzMyNTkxLCJleHAiOjE3NDYzMDgyNTcuNjY2OTUxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XfCQQVkOENFpD9Ozyvjj5Yi9cdfrxtvMv7zTZ9hivqzENiQMGOh0iCmtvgtaJ5d3inR6UMJ6tou8rfrm7kuzE4EJ6jdf_yOxKalbkwM6gTzFHk_pthrcOM5wMLd_-7k1Epg03dv4hPcSvRP-xKHfx5242GW-k9_K7oXzKFTeCk4Cxy5lhb2pRFbNSScNBHZ9DE6FhUJINgqw2h6Y6LVios-ic-EYbieZ0DGUn_MHnchXSIC9RHkOE4wsLQF7lWl0si2R6V7Cnbb2h1QHUis5H5Bl6qrjHM79ksCsBGb-MH9pcTme8DVocMj5VJGtioVDIg6D7MO9X27aHBOAxy9Nv1c2fm5wserwNIu1T489pmow__TR-XtvogFCA1WF8FHBStiho9t3og3DlVeHXg3Y3AtQ3qILFlp7kanS0i8DLtPfUjqz00eXHoc9q6ISgrVzfZ0xEQbDm1XP-MisimdTR-xhGSglrZf4vZrlXtGNlNU31eibjCzQztC1l1HscawPuz3FSIbb7bwBnE1PexyH5Li-55qYYGTLonaHuJaBPChiFKc_oPFi3kkkTMMX3x6PZakaPvfwea0jvd7IX9jMLprQ0QPc3uXXzv3OOrEfRo2gPVWIO6F8jp9Ye59SLTQPF0kELEp68GgYaH9AXXbV7tphgQdJMnI9sUbPqZoaxCs";
    var response=await http.get(url,headers: {
      'Accept':'application/json',
      'Authorization': 'Bearer ${Url.Token_user}',
    });
    print("ff");
    print(response.body);
    print(response.statusCode);

    if(response.statusCode==200){
      //    var jsonresponse=jsonDecode(response.body);
      var cart=cartFromJson(response.body);
      print(response.body);
      return  cart.myCart;
      
    }
    else
return MyCart(id: 0, userName: '',
    items: [], customBouquets: []);


  }





}
