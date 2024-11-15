import 'package:get/get.dart';
import 'package:new_proj/models/provides_model.dart';
import 'package:new_proj/serves/registerprovider_serves.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class registerproviderController extends GetxController {







  File? image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;

  Future getImage() async {
    // final ImagePicker picker = ImagePicker();
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.gallery);
    if (imagee != null) {
      image = File(imagee.path);
      imagepath.value = imagee.path.toString();
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
  var name;

  var phone;
  var confirm_password;
  var registerstatus;
  var error;
  var token;
  var message;
  late registerproviderserves serves;
  @override
  void onInit() {
  email='';
  password='';
  name='';

  phone='';
  confirm_password='';
  registerstatus=false;
  error='';
  token='';
  message='';
  //  checkboxstatus=false.obs;
  serves=registerproviderserves();
  super.onInit();
  }


  onclickregisterprovider() async{

  provider provid=provider(password: password,email: email,name: name,
  phone: phone,confirmpassword: confirm_password);

  registerstatus= await serves.registerprovider( provid ,image!);//checkboxstatus.value);
  error=serves.error;
  print(error);
  token=serves.token;
  message=serves.message;
  }

  }


