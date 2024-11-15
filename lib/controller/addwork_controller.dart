import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:new_proj/consts/url.dart';

class AddWorkController extends GetxController {
  
  int status_add=0;
  var description = "";
   final RxList<File> selectedImages = <File>[].obs;

  var selectedItem = 'Flowers'.obs;
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
      selectedImages.add(image!);
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
     selectedImages.add(image!);
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

 

  Future AddWork() async {
    print("list is");
    print(selectedImages.toList());
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_prov}'
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('${Url.domain}/provider/add-post'));
      request.fields.addAll({
        'provider_id' :"${Url.saved_id_prov}",
        'description': description,
      
      });
        for (int i = 0; i < selectedImages.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('post_images[]', selectedImages[i].path.toString())
      );
     }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_add = response.statusCode;
      print(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
       
       
        print(response.statusCode);
        print("okkkkk add");
         EasyLoading.showSuccess("Post added successfully");
        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk add");
        print(response.request); 
         EasyLoading.showError(jsonDecode(responseBody)['message']);
        //update();
      }
    } catch (e) {
      print(e);
       EasyLoading.showError(e.toString());
    }
  }
}