import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/user_models.dart';

import 'package:new_proj/consts/storage.dart';
class loginserves{

  var url=Uri.parse(Url.domain+Url.login);
  var error='';
  var token='';
  var iduser=0;
  var message;
  Future<bool> login(user use , bool checkbox)async{
    var response= await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },
      body: {

        'email':use.email,
        'password':use.password ,

      },
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var responsejson=jsonDecode(response.body);
      token=responsejson['data']['api_token'];
      iduser=responsejson['data']['id'];

      print(token);
      message='success login';
      Url.Token_user=token;
      Url.id_user=iduser;
      Securestorage storage=new Securestorage();
        await  storage.save('token_user',  Url.Token_user);
        await  storage.save('id_user',  "${Url.id_user}");
      
      print(iduser);
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
      error='Failed Login username or password is invalid';
      //   print(error);

      return false;
    }
  }

}