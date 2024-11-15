import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../consts/colors.dart';
import '../../../../controller/profile_provider_controlller.dart';
import '../../../../consts/url.dart';
import '../../widget/button_gradient.dart';
import '../../widget/text.dart';
// ignore: must_be_immutable
class ProfileProvider extends StatelessWidget {
  
   var userController= Get.find<ProfileProviderController>();
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
            if (userController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
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
                      text: 'Profile',
                      color: Colors.brown,
                      underLine: TextDecoration.none,
                      fontfamily: 'OleoScript',
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: const Color.fromRGBO(136, 102, 15, 0.5),
                        ),
                        // CircleAvatar(
                        //   radius: 88,
                        //   backgroundImage: AssetImage('assets/images/profile.png',),
                        //   // NetworkImage('$baseUrl'+'${userController.userProfile.value.imageUrl}'),
                        // ),
                        CircleAvatar(
                          backgroundImage: NetworkImage('${Url.domain}'+'${userController.profile.value.profileImageUrl}'),
                          radius: 88,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                            children: [
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 50,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height - 390,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.brown.withOpacity(0.4),
                                      spreadRadius: 3.0,
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        TextUtils(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          text: 'Name:${userController.profile.value.name}',
                                          //    ' ${controller.profile.value.name}',
                                          color: Colors.brown,
                                          underLine: TextDecoration.none,
                                          fontfamily: 'OleoScript',
                                        ),

                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextUtils(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          text: 'Email:${userController.profile.value.email} ',
                                          //'${controller.profile.value.email}',
                                          color: Colors.brown,
                                          underLine: TextDecoration.none,
                                          fontfamily: 'OleoScript',
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextUtils(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          text: 'Phone:${userController.profile.value.phone}',
                                          //' ${controller.profile.value.phone}',
                                          color: Colors.brown,
                                          underLine: TextDecoration.none,
                                          fontfamily: 'OleoScript',
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
                                          height: 35,
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              Basic_Button(text: 'Update Profile',
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width - 200,
                                                hight: 44,
                                                onPressed: () {
                                                  Get.toNamed('/profileUPProvider');
                                                },),

                                              const SizedBox(
                                                height: 30,
                                              ),
                                              // Basic_Button(text: 'Show tasks',
                                              //   width: MediaQuery
                                              //       .of(context)
                                              //       .size
                                              //       .width - 200,
                                              //   hight: 44,
                                              //   onPressed: () {
                                              //     Get.toNamed('/tasks');
                                              //   },),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}




