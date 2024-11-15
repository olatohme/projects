import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/controller/contact_controller.dart';

import '../../../consts/colors.dart';

import '../../widget/button_gradient.dart';
import '../../widget/text.dart';

class ContactUs extends StatelessWidget {
   ContactUs({Key? key}) : super(key: key);
  final ContactController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: backColor,
          ),
          child:  Obx(() {
            if (controller.contact.value.email.isEmpty) {
              return Center(child: CircularProgressIndicator());
    } else
    return Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    IconButton(
    onPressed: () {
      Get.back();
    },
    icon: Icon(Icons.navigate_before),
    iconSize: 25,
    color: Colors.brown,
    ),
    ],
    ),
    TextUtils(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    text: 'Contact Us',
    color: Colors.brown,
    underLine: TextDecoration.none,
    fontfamily: 'OleoScript',
    ),
    SizedBox(height: 90,),

    Container(
    width:  MediaQuery.of(context).size.width - 50,
    height: MediaQuery.of(context).size.height * .45,
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(75),
    ),
    boxShadow:[
    BoxShadow(
    color: Colors.brown,
    spreadRadius: 3.0,
    blurRadius: 6.0,
    ),
    ],
    ),
    child: Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(
    height: 20,
    ),
    Row(
    children: [
    IconButton(
    onPressed: () {
    },
    icon: Icon(Icons.phone),
    iconSize: 25,
    color: Colors.brown,
    ),
    TextUtils(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    text: '${controller.contact.value.phone}',
    color: Colors.brown,
    underLine: TextDecoration.none,
    fontfamily: 'OleoScript',
    ),
    ],
    ),
    Row(
    children: [
    IconButton(
    onPressed: () {
    },
    icon: Icon(Icons.email),
    iconSize: 25,
    color: Colors.brown,
    ),
    TextUtils(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    text: '${controller.contact.value.email}',
    color: Colors.brown,
    underLine: TextDecoration.none,
    fontfamily: 'OleoScript',
    ),
    ],
    ),
    Row(
    children: [
    IconButton(
    onPressed: () {
    },
    icon: Icon(Icons.location_on),
    iconSize: 25,
    color: Colors.brown,
    ),
    TextUtils(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    text: '${controller.contact.value.address}',
    color: Colors.brown,
    underLine: TextDecoration.none,
    fontfamily: 'OleoScript',
    ),
    ],
    ),

    const SizedBox(
    height: 20,
    ),
    Divider(
    height: 1,
    endIndent: 50,
    color: Colors.brown,
    ),

    const SizedBox(
    height: 40,
    ),
    Center(
    child: Basic_Button(text: 'Go Back ',
    width:  MediaQuery.of(context).size.width-200 ,
    hight:44,
    onPressed: (){
      Get.back();
    },
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    );
          }),
        ),
      ),
    );
  }
}
