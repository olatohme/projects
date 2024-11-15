import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/profile_user_controller.dart';
import 'package:new_proj/view/widget/button_gradient.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../../../controller/profile_update_user_controller.dart';

class ProfileUPdateUser extends StatelessWidget {
  ProfileUPdateUser({Key? key}) : super(key: key);
  final controller = Get.find<ProfileUpdateUser_Controller>();
  final ProfileUserController controlleruser = Get.put(ProfileUserController());
  final RxBool _obscureText = true.obs;
  final RxBool _obscureText2 = true.obs;
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child:SafeArea(
            child: Scaffold(
              body:
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: backColor,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                controlleruser.getUserProfile();
                                Get.back();
                              },
                              icon: Icon(Icons.navigate_before),
                              iconSize: 25,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                        Center(
                          child: TextUtils(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            text: 'Profile',
                            color: Colors.brown,
                            underLine: TextDecoration.none,
                            fontfamily: 'OleoScript',
                          ),
                        ),
                        SizedBox(height: 20,),
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
                              if (controller.user_image == null &&
                                  controller.updat.value == false)
                                return Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey.shade400,
                                );
                              else
                                return CircleAvatar(
                                    radius: 100, // قطر الدائرة
                                    backgroundImage: FileImage(controller.user_image!) // المسار لصورتك
                                );
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  text: 'Name',
                                  color: Colors.brown,
                                  underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                ),
                              ),
                              CustomTextField(
                                validator: (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter a name';
                                  // }
                                  // else{ return null;}
                                },
                                onchange: (value ) {
                                  controller.name=value;
                                },
                                hight: 10,
                                width: 350,
                                hintText: 'Name',
                                obscureText:false,
                                prefixIcon:  Text(""),
                                suffixIcon:  Text(""),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  text: 'Email',
                                  color: Colors.brown,
                                  underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                ),
                              ),
                              CustomTextField(
                                validator: (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter an email';
                                  // }
                                  if (value.isNotEmpty && !RegExp(validationEmail).hasMatch(value)) {
                                    return 'Invalid email';
                                  } else {
                                    return null;
                                  }
                                },
                                onchange: (value ) {
                                  controller.email=value;
                                },
                                hight: 10,
                                width: 350,
                                hintText: 'email',
                                obscureText:false,
                                prefixIcon:  Text(""),
                                suffixIcon:  Text(""),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  text: 'Phone',
                                  color: Colors.brown,
                                  underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                ),
                              ),
                              CustomTextField(
                                validator: (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter a phone';
                                  // }
                                   if (value.isNotEmpty && !RegExp(validationPhone).hasMatch(value)) {
                                    return 'Invalid Phone';
                                  } else {
                                    return null;
                                  }
                                },
                                onchange: (value ) {
                                  controller.phone=value;
                                },
                                hight: 10,
                                width: 350,
                                hintText: 'phone',
                                obscureText:false,
                                prefixIcon:  Text(""),
                                suffixIcon:  Text(""),
                              ),    SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  text: 'Password',
                                  color: Colors.brown,
                                  underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                ),
                              ),
                              Obx(
                                    () =>
                                        CustomTextField(
                                  validator: (value) {
                                    // if (value.isEmpty) {
                                    //   return 'Please enter a password ';
                                    // }
                                    if (value.isNotEmpty && value.toString().length < 6) {
                                      return 'Password should be longer or equal to 6 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onchange: (value ) {
                                    controller.password=value;
                                  },
                                  hight: 10,
                                  width: 350,
                                  hintText: 'password',
                                  prefixIcon: GestureDetector(
                                      onTap: () {
                                        _obscureText.toggle();
                                        print(_obscureText
                                            .value); // تبديل قيمة الـ RxBool بين true و false
                                      },
                                      child: Icon(
                                        _obscureText.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: _obscureText.value ? Colors.brown : Colors.brown,
                                      )),
                                  obscureText: _obscureText.value,
                                  suffixIcon:  Text(""),
                                ),
                              ),

                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  text: 'Confirm Password',
                                  color: Colors.brown,
                                  underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                ),
                              ),
                              Obx(
                                    () =>CustomTextField(
                                      validator: (value) {
                                        if(controller.password.isNotEmpty){
                                          if (value.isEmpty) {
                                            return 'Please enter a confirm password ';
                                          }
                                          if (value.isNotEmpty && value != controller.password) {
                                            return 'The password and its confirmation are not the same';
                                          }
                                        }

                                        else {
                                          return null;
                                        }
                                      },
                                  onchange: (value ) {
                                    controller.password_confirmation=value;

                                  },
                                  hight: 10,
                                  width: 350,
                                  hintText: 'password',
                                  prefixIcon: GestureDetector(
                                      onTap: () {
                                        _obscureText2.toggle();
                                        print(_obscureText2
                                            .value); // تبديل قيمة الـ RxBool بين true و false
                                      },
                                      child: Icon(
                                        _obscureText2.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: _obscureText2.value ? Colors.brown : Colors.brown,
                                      )),
                                  obscureText: _obscureText2.value,
                                  suffixIcon:Text(''),

                                ),),
                              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                              Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Basic_Button(text: 'Update',
                                  width:  MediaQuery.of(context).size.width *0.8 ,
                                  hight:44,
                                  onPressed: ()async{
                                    if (fromKey.currentState!.validate()) {
                                     await EasyLoading.show(status: 'loading');
                                      await controller.ProfileUpdateuser();
                                     
                                     await controlleruser.getUserProfile(); 
                                      Get.back();
                                      // Get.offNamed('/');
                                    }
                                  },),
                              ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                            ],
                          ),
                        ),


                      ],

                    ),
                  ),
                ),


              ),

            )
        ));
  }

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

