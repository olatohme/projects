import 'package:get/get.dart';
import 'package:new_proj/models/user_models.dart';
import 'package:new_proj/serves/registeruser_serves.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class registeruserController extends GetxController {














  File? image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;

  Future getImage() async {
    // final ImagePicker picker = ImagePicker();
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.gallery);
    print("imageeee evet");
    if (imagee != null) {
     
      image = File(imagee.path);
      imagepath.value = imagee.path.toString();
       print("imageeee yessss");
       print(image!.path.toString());
      updat(!updat.value);
      update();
    } else {
      print("no image");

      // Get.snackbar('error', 'No Image Selected',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: red,
      //     colorText: white);
    }
  }
  Future getImageCamera() async {
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.camera); // تحديد مصدر الصورة للكاميرا
    if (imagee != null) {
      image = File(imagee.path);
      imagepath.value = imagee.path.toString();
      updat(!updat.value);
      update();
    } else {
      print("no image");
      // إظهار رسالة في حالة عدم اختيار الصورة
      // Get.snackbar('error', 'No Image Selected',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: red,
      //   colorText: white);
    }}













  var email;
  var password;
  var first_name;
  var last_name;
  var phone;
  var imagee;
  var confirm_password;
  var registerstatus;
  var error;
  var token;
  var message;
  late registerusetrserves serves;
  @override
  void onInit() {
    email='';
    password='';
    first_name='';
     last_name='';
     phone='';
     imagee='';
     confirm_password='';
    registerstatus=false;
    error='';
    token='';
    message='';
    //  checkboxstatus=false.obs;
    serves=registerusetrserves();
    super.onInit();
  }


  onclickregisteruser() async{

    user use=user(password: password,email: email,first_name: first_name,last_name: last_name,
    phone: phone,confirmpassword: confirm_password,image: imagee);

    registerstatus= await serves.registeruserr( use ,image!);//checkboxstatus.value);
    error=serves.error;
    print(error);
    token=serves.token;
    message=serves.message;
  }



}
