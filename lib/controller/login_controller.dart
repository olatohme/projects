import 'package:get/get.dart';
import 'package:new_proj/models/user_models.dart';
import 'package:new_proj/serves/login_serves.dart';

class loginController extends GetxController {

  var email;
  var password;
  var loginstatus;
  var error;
  var token;
  var message;
  late loginserves serves;
  @override
  void onInit() {
    email='';
    password='';
    loginstatus=false;
    error='';
    token='';
    message='';
  //  checkboxstatus=false.obs;
    serves=loginserves();
    super.onInit();
  }


  onclicklogin() async{

    user use=user(password: password,email: email);

    loginstatus= await serves.login( use ,false);//checkboxstatus.value);
    error=serves.error;
    print(error);
    token=serves.token;
    message=serves.message;
  }
}
