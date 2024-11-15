import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/provides_model.dart';


import 'package:new_proj/consts/storage.dart';
class registerproviderserves{



  var dio = Dio();
  var url = Uri.parse(Url.domain + Url.registerproviderr);
  var message;
  var error='';
  var token='';
var idprovider=0;
  Future<bool> registerprovider(provider providerr, File file) async {
     try {
      var headers = {
        'Accept': 'application/json',
        
      };
      var request = http.MultipartRequest('POST',
          Uri.parse(Url.domain + Url.registerproviderr));
        print("11111");
        print("${providerr.name}");
        print("${providerr.email}");
        print("${providerr.password}");
         print("${providerr.phone}");
        print("${providerr.confirmpassword}");

      request.fields.addAll({
        // 'provider_id' :"${id}",\
        'name':"${providerr.name}",
        'email':"${providerr.email}",
      'password':"${providerr.password}" ,
      'phone':"${providerr.phone}",
      'password_confirmation':"${providerr.confirmpassword}",
      
      
      });
       print("22222");
      request.files.add(
          await http.MultipartFile.fromPath('image', file.path.toString())
      );
    
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
        print("333333");
       var data = jsonDecode(responseBody);
      
       print("4444");
       print(response.statusCode);
       print(responseBody);
       print(data);
      if (response.statusCode == 200) {
        message=data['message'];
        token=data['access_token'];
       print("555");
       idprovider=data['provider']['id'];
      print("66666");
        

      print(token);
      print(idprovider);
      // message='sucess register';
     Url.Token_prov=token;
      Url.id_provider=idprovider;
      
       Securestorage storage=new Securestorage();
        await  storage.save('token_prov_reg',  Url.Token_prov);
        await  storage.save('id_prov_reg',  "${Url.id_provider}");
      print( Url.id_provider);
      print("tatus code");
      print(response.statusCode);
        print("yesss reg");
        return true;
      }
      else{
        print(jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      print("exception");
      
      print(e);}
    return false;
    // print(url);
    // var a = {
    //   'image': await MultipartFile.fromFile(file.path,
    //       filename: file.path.split('/').last),
    //   'email':providerr.email,
    //   'password':providerr.password ,
    //   'phone':providerr.phone,
    //   'password_confirmation':providerr.confirmpassword,
    //   'first_name':providerr.name,
    // };


    // print(a);
    // FormData form = FormData.fromMap(a);
    // print("hjgkgb"+file.path);
    // try {
    //   print("hjgkgb");
    //   Response response = await dio.post(
    //     '$url',
    //     options: Options(headers: {
    //       'Accept': 'application/json',
    //       //  'Authorization': 'Bearer $token',
    //     }),
    //     data: form,
    //   );
    //   print("ggg");
    //   var responsejson=jsonDecode(response.data);
    //   print(response.data);
    //   token=responsejson['access_token'];
    //   idprovider=responsejson['provider']['id'];
    //   print(idprovider);
    //   print(token);
    //   message='sucess';
    //   Url.Token_user=token;
    //   Url.id_provider=idprovider;
    //   if (response.statusCode == 200) {
    //     return true;
    //   }
    // } catch (e) {}
    // return false;


  }
  /*var url=Uri.parse(serverconfig.domainserver+serverconfig.registerproviderr);
  var error='';
  var token='';
  var message;
 Future<bool> registerprovider(provider providerr , bool checkbox)async{
    print('${url}');
    var response= await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },
      body: {

        'email':providerr.email,
        'password':providerr.password ,
        'phone':providerr.phone,
        'password_confirmation':providerr.confirmpassword,
        'first_name':providerr.name,


      },
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var responsejson=jsonDecode(response.body);
      token=responsejson['access_token'];
      print(token);
      message=responsejson['success'];
      userinformation.providertoken=token;
      /*  if(checkbox){
        securestorsge storage=new securestorsge();
        await  storage.save('token', userinformation.usertoken);
      }*/

      return true;
    }
    else if(response.statusCode==404){
      var responsejson=jsonDecode(response.body);
      error=responsejson['error'];
      print(error);
      return false;

    }
    else{
      error='you have error';
      //   print(error);

      return false;
    }
  }*/

}