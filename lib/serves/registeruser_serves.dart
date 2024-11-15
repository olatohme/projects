import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/user_models.dart';

class registerusetrserves{
  var dio = Dio();
  var url = Uri.parse(Url.domain + Url.registeruserr);
  var message;
  var error='';
  var token='';
var iduser=0;
  Future<bool> registeruserr(user use, File file) async {
    try {
      print("11111");
      var headers = {
        'Accept': 'application/json',
        
      };
      print("22222");
      var request = http.MultipartRequest('POST',
          Uri.parse(Url.domain + Url.registeruserr));
      request.fields.addAll({
        // 'provider_id' :"${id}",
        'email':"${use.email}",
      'password':"${use.password}" ,
      'phone':"${use.phone}",
      'password_confirmation':"${use.confirmpassword}",
      'name':"${use.first_name}",

      });
      print("nowwwwwwwwwwwwwwwwww");
      print("imageeee ");
       print(file.path.toString());
      request.files.add(
          await http.MultipartFile.fromPath('user_image', file.path.toString())
      );
      print("4444");
      request.headers.addAll(headers);
      print("5555");
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print("6666");
       var data = jsonDecode(responseBody);
       print(data);
      print("77777");


      print(token);
      print(iduser);
      message='sucess';
      error="Failed regester Check the entered information ";
     Url.Token_user=token;
      Url.id_user=iduser;
      print(Url.id_user);
      print(response.statusCode);
      if (response.statusCode == 200) {
        token=data['access_token'];
        print("8888");
        iduser=data['user']['id'];
        print("9999");
        print("yess regester");
        print(responseBody);
        return true;
      }
      else{
        print(responseBody);
        print("noo regester");
      }
    } catch (e) {print(e.toString);
    print("excepttion..");
    }
    return false;
    //   print(responseBody);
    //   if (response.statusCode == 201 || response.statusCode == 200) {
    //     var data = jsonDecode(responseBody);
       
    //     print(response.statusCode);
    //     print("okkkkk add");
    //      EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
    //     // productList = await showprod();
    //     // print(isloading);
    //     // isloading(!isloading.value);
    //     // print(isloading);
    //   } else {
    //     // print(token);
    //     print(response.statusCode);
    //     print("not okkk add");
    //     print(response.request); 
    //      EasyLoading.showError(jsonDecode(responseBody)['message']);
    //     //update();
    //   }
    // } catch (e) {
    //   print(e);
    //    EasyLoading.showError(e.toString());
    // }

// print(url);
//  var a = {
//   //  await http.MultipartFile.fromPath('images[${i}]', selectedImages[i].path.toString())
//      'image': await http.MultipartFile.fromPath('image' ,file.path.toString()),
     
//       'email':use.email,
//       'password':use.password ,
//       'phone':use.phone,
//       'password_confirmation':use.confirmpassword,
//       'first_name':use.first_name,
//       'last_name':use.last_name,
//     };


//     print(a);
//     FormData form = FormData.fromMap(a);
// print("hjgkgb"+file.path);
//     try {
//       print("hjgkgb");
//       Response response = await dio.post(
//         '$url',
//         options: Options(headers: {
//           'Accept': 'application/json',
//         //  'Authorization': 'Bearer $token',
//         }),
//         data: form,
//       );
//       print("ggg");
//       var responsejson=jsonDecode(response.data);
//       print(response.data);
//       token=responsejson['access_token'];
//       iduser=responsejson['user']['id'];

//       print(token);
//       print(iduser);
//       message='sucess';
//      Url.Token_user=token;
//       Url.id_user=iduser;
//       print(Url.id_user);
//       if (response.statusCode == 200) {
//         return true;
//       }
//     } catch (e) {}
//     return false;


  }



























/*
  var url=Uri.parse(serverconfig.domainserver+serverconfig.registeruserr);
  var error='';
  var token='';
  var message;
  Future<bool> registeruserr(user use , File file)async{
    print(url);
    var response= await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },

      body: {

        'email':use.email,
        'password':use.password ,
        'phone':use.phone,
        'password_confirmation':use.confirmpassword,
        'first_name':use.first_name,
        'last_name':use.last_name,

      },
    );
    print ('kk');
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var responsejson=jsonDecode(response.body);
      token=responsejson['access_token'];
      print(token);
      message='sucess';
      userinformation.usertoken=token;
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
  }
*/
}