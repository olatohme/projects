import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/addwork_controller.dart';
import 'package:new_proj/controller/posts_controller.dart';
import 'package:new_proj/view/widget/button_gradient.dart';


import 'package:new_proj/view/widget/textfield.dart';


// ignore: must_be_immutable
class AddWork extends StatelessWidget {
 var controller = Get.find<AddWorkController>();
  var controller1 = Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: 
          SingleChildScrollView(
            child: Container(
                 width: MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.height,
                      decoration: ShapeDecoration(
                        gradient: backColor,  shape: RoundedRectangleBorder(
                       
                        ),),
              child: Column(
                children: [ SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        //  Get.toNamed('/points'),
                        icon: Icon(Icons.chevron_left),
                        color: darkbeige,
                        iconSize: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.21,),
                      Text(
                          " Add Work",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                             fontFamily: 'Kings',
                            color: darkbeige,
                            fontSize: 30,
                          ),
                        ),
              
                  ],),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                   Stack(children: [
              Container(
                width: 180,
                height: 180,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(136, 102, 15, 0.5),
                    width: 2,
                  ),
                  color: Colors.white,
                ),
                child: Obx(() {
                  if (controller.image == null &&
                      controller.updat.value == false)
                    return Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey.shade400,
                    );
                  else
                    return CircleAvatar(
      radius: 100, // قطر الدائرة
      backgroundImage: FileImage(controller.image!) // المسار لصورتك
    );
                    // Image.file(
                    //   controller.image!,
                    //   fit: BoxFit.cover,
                    // );
                }),
              ),
              Positioned(
                top: 80,
                left: 100,
                child: InkWell(
                  onTap: () {
                    //  controller.getImage();
                     _showBottomSheet(context);
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(136, 102, 15, 0.5),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 28,
                      color: pink
                    ),
                  ),
                ),
              )
            ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
        
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Row(
                    children: [
                    Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child:   Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ const Text(
                                  "  Description",
                                  style: TextStyle(
                                    fontFamily: 'OleoScript',
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(211, 179, 152, 1),
                        
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 20,),
                              TextField_desc(
                                    hintText: '  add description',
                                  
                                    obscureText: false,
                                    validator: (value) {
                                     
                                    },
                                    hight: MediaQuery.of(context).size.height *0.07 ,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    keyboardType: TextInputType.emailAddress,
                                    onchange: (value) {
                                      controller.description= value;
                                    },
                                  ),],),),
                    ],
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                    Basic_Button(
                          
                          hight:MediaQuery.of(context).size.height * 0.06 ,
                         width: MediaQuery.of(context).size.width *0.7,
                         onPressed: ()async{
                          print("clickkkkk");
                           EasyLoading.show(status: 'Loading..');
                          await controller.AddWork();
                          
                          Get.back();
                          controller1.fetchPosts();
                          print("lenghth");
                          print(controller1.profile.value.posts);
                         },
                          text: "ADD")     
                    
              ],)
          
                   ))));}
   void _showBottomSheet(BuildContext context) {
    
     // ignore: unused_local_variable
     final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(seconds: 2), // تعديل مدة الحركة هنا
    );
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
         
            height:MediaQuery.of(context).size.height * 0.25 ,
             width: MediaQuery.of(context).size.width , // ارتفاع الشيت بوتوم
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                        Icons.add_a_photo_outlined,
                        size: 28,
                        color: pink
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width *0.07),
                    InkWell(
                      onTap: () {
                          controller.getImageCamera();
                        Get.back();
                      },
                      child: Text(
                                          "Take the picture with the camera",
                                          style: TextStyle(
                                            fontFamily: 'OleoScript',
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.normal,
                                            color: darkbeige,
                                
                                            fontSize: 16,
                                          ),
                                        ),
                    ),
                  ],
                ),
              ),
              
                               SizedBox(
                  height: 50,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                        Icons.perm_media_outlined,
                        size: 28,
                        color: pink
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width *0.07),
                    InkWell(
                      onTap: () {
                        controller.getImage();
                        Get.back();
                      },
                      child: Text(
                                          "Choose an image from the gallery",
                                          style: TextStyle(
                                            fontFamily: 'OleoScript',
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.normal,
                                            color: darkbeige,
                                
                                            fontSize: 16,
                                          ),
                                        ),
                    ),
                  ],
                ),
              ),
                
              ],
            ),
          
        );
      },
    );
  }
                   
                   }