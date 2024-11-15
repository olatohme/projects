import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/view/screens/User/login_screen.dart';
import 'package:new_proj/view/screens/User/regiseruser_screen.dart';


import 'package:new_proj/view/widget/gradient_text.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../widget/button2.dart';
import '../../widget/button_gradient.dart';



class signorlogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height*0.1,
                  left: MediaQuery.of(context).size.width*0.25,
                  child:  TextUtils(text: 'Welcome Back !',  fontfamily: 'OleoScript',fontSize:30,fontWeight: FontWeight.w500,
                        color: darkbeige,
                         underLine: TextDecoration.none,),
                  ),
                
                // SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            
               
            
                     
                      Positioned(
                  top: MediaQuery.of(context).size.height*0.3,
                  left: MediaQuery.of(context).size.width*0.1,
                  child:  Container(
                        height: MediaQuery.of(context).size.height*0.6,
                        width: MediaQuery.of(context).size.height*0.4,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [ Color(0xFFFFF1E1),Color(0xFFF5F5F5)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                        ),
                        child: SafeArea(
                          child:
            
            
            
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
            
                              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                              Basic_Button(
                                hight: 40,
                                text: 'Sign up',
                                width: 270,
                                onPressed: () {
                                  Get.to(registeruser());
                                },
            
            
                              ),
            
                              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                                B_Button(
                                hight: 40,
                                text: 'Sign in',
                                width: 270,
                                onPressed: () {
                                    Get.to(login());
                                },
            
            
                              ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              
                               TextButton(onPressed: (){
                               Get.toNamed('/home');
                           },
                               child: GradientText(
                                 'Skip',
                                 style: const TextStyle(fontSize: 20,fontFamily: 'BadScript',),
                                 gradient: LinearGradient(colors: [
                                   darkbeige,
                                   pink,
                                 ]),
                               ),),
                  
                              
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            
            
                            ],
                          ),
            
                        ),
                      ),),
                        Positioned(
                            top: MediaQuery.of(context).size.height*0.22,
                  left: MediaQuery.of(context).size.width*0.32,
                          child: Container(
                                      
                          width: 150,
                          height: 150,
                                      
                          decoration: ShapeDecoration(
                             image: DecorationImage(
                  image:AssetImage("assets/images/logo.png"),
                     
                  fit: BoxFit.cover,
                ),
                            color: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          //    color: Colors.deepOrangeAccent,
                                      
                                                ),
                        ),
                  
              
              ],
            ),
          ),
        ),
      ),

    );

  }
}