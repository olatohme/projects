import 'package:get/get.dart';
import 'package:new_proj/models/provides_model.dart';

import 'package:new_proj/serves/loginprovider_serves.dart';

class loginproviderController extends GetxController {

  var email;
  var password;
  var loginstatus;
  var error;
  var token;
  var message;
  late loginproviderserves serves;
  @override
  void onInit() {
    email='';
    password='';
    loginstatus=false;
    error='';
    token='';
    message='';
    //  checkboxstatus=false.obs;
    serves=loginproviderserves();
    super.onInit();
  }


  onclicklogin() async{

    provider pr=provider(password: password,email: email);

    loginstatus= await serves.loginprovider( pr ,false);//checkboxstatus.value);
    error=serves.error;
    print(error);
    token=serves.token;
    message=serves.message;
  }
}
