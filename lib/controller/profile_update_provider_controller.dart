import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_proj/consts/url.dart';

class ProfileUpdateProvider_Controller extends GetxController {
  bool isVisibilty = false;
  String name='';
  String email='';
  String method='PUT';
  var  phone='';
  String password='';
  String password_confirmation='';
  int status_update=0;
  File? profile_image;
  RxBool updat = false.obs;
  RxString imagepath = ''.obs;
  final RxBool isEmailValid = RxBool(false);
  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }
  void validateEmail() {
    if (GetUtils.isEmail(email)) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
    }
  }
  Future getImage() async {
    // final ImagePicker picker = ImagePicker();
    final picker = ImagePicker();
    final imagee = await picker.pickImage(source: ImageSource.gallery);
    if (imagee != null) {
      profile_image = File(imagee.path);
      imagepath.value = imagee.path.toString();
      updat(!updat.value);
      update();
    } else {
      return null;
   

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
      profile_image = File(imagee.path);
      imagepath.value = imagee.path.toString();
      updat(!updat.value);
      update();
    } else {
      return null;
     
      // إظهار رسالة في حالة عدم اختيار الصورة
      // Get.snackbar('error', 'No Image Selected',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: red,
      //   colorText: white);
    }}

  Future ProfileUpdateprovider()async{
    print('in profile provider update');
    print("image");
    print(profile_image);
    try{
      var headers={
        'Accept':'application/json',
      };
      var request =http.MultipartRequest('POST',Uri.parse('${Url.domain}/provider/update/${Url.saved_id_prov}'));
      if(name!="")
        request.fields.addAll({
          'name':name,
        });
      if(phone!="")
        request.fields.addAll({
          'phone':phone,
        });
      if(email!="")
        request.fields.addAll({
          'name':email,
        });
      if(method!="")
        request.fields.addAll({
          '_method':method,
        });
      if(password!=""&& password_confirmation!="")
        request.fields.addAll({
          'password':password,
          'password_confirmation': password_confirmation,
        });
      // request.fields.addAll(
      //     {
      //       'name':name,
      //       'email':email,
      //       'phone':phone,
      //       '_method':method,
      //       'password':password,
      //       'password_confirmation': password_confirmation,
      //
      //
      //     });
      if(profile_image!=null)
        request.files.add(await http.MultipartFile.fromPath('profile_image',imagepath.toString()));
      request.headers.addAll(headers);
      http.StreamedResponse response =await request.send();
      String responseBody=await response.stream.bytesToString();
      status_update=response.statusCode;
      print('response body');
      print(responseBody);
      print(response.statusCode);
      var data = jsonDecode(responseBody);
      if(response.statusCode == 201 || response.statusCode == 200){
        print(response.statusCode);
        EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
      }
      else {
        EasyLoading.showError(data['message']);
        print(response.statusCode);
      }
    }
    catch (e) {
      print("error message   ");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

}