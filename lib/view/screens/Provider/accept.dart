import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/view/screens/Provider/login_provider.dart';
import 'package:new_proj/view/widget/button2.dart';
import 'package:new_proj/view/widget/text.dart';

class Accept extends StatelessWidget {
 
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
                children: [
                  SizedBox(height: 50,),
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Container(
                   
                      width: 250,
                      height: 250,
                   
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:AssetImage("assets/images/accept.png"),
                   
                          fit: BoxFit.cover,
                        ),
                        color:Colors.transparent  ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      //    color: Colors.deepOrangeAccent,
                   
                    ),
                 ),

                    SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: TextUtils(text: 'Thank you for joining our app!',  fontfamily: 'OleoScript',fontSize:25
                     ,fontWeight: FontWeight.w200,
                      color: Colors.black87,
                      underLine: TextDecoration.none,),
                   ),
                      SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: TextUtils(text: ' Your request is accepted',  fontfamily: 'OleoScript',fontSize:20
                     ,fontWeight: FontWeight.w200,
                      color: darkbeige,
                      underLine: TextDecoration.none,),
                   ),
                     SizedBox(height: 50,),
                     Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: B_Button(
                                hight: 40,
                                text: 'Sign in',
                                width: 270,
                                onPressed: () {
                                  Get.to(loginprovider());
                                    
                                  

                                  // Get.toNamed('/providers');
                                },


                              ),),


                 ])))));}}