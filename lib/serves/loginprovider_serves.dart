import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/provides_model.dart';

import 'package:new_proj/consts/storage.dart';
class loginproviderserves{

  var url=Uri.parse(Url.domain+Url.loginprovider);
  var error='';
  var token='';
  var message;
  var idprovider=0;
  Future<bool> loginprovider(provider pr , bool checkbox)async{
    var response= await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },
      body: {

        'email':pr.email,
        'password':pr.password ,

      },
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var responsejson=jsonDecode(response.body);
      token=responsejson['access_token'];
      idprovider=responsejson['provider']['id'];
      print(idprovider);
      print(token);
      message='success login';
      Url.Token_prov=token;
      Url.id_provider=idprovider;
      print("id  ${Url.id_provider}");
       Securestorage storage=new Securestorage();
        await  storage.save('token_provider',  Url.Token_prov);
        await  storage.save('id_provider',  "${Url.id_provider}");
        Url.Token_prov=await storage.read('token_provider');
         Url.saved_id_prov=await storage.read('id_provider');
        print("id  ${ Url.saved_id_prov}");
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
      error='you have error';
      //   print(error);

      return false;
    }
  }

}