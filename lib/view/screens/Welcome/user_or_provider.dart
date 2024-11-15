import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/home_controller.dart';
import 'package:new_proj/controller/profile_provider_controlller.dart';

import 'package:new_proj/controller/tasks_controller.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/view/screens/Provider/login_provider.dart';
import 'package:new_proj/view/screens/Provider/register_provider_screen.dart';
import 'package:new_proj/view/screens/Provider/signuporsignin_prov.dart';
import 'package:new_proj/view/screens/User/signup_or_signin.dart';

import 'package:new_proj/view/widget/text.dart';

import '../../../consts/colors.dart';
import '../../widget/button2.dart';
import '../../widget/button_gradient.dart';


// ignore: must_be_immutable
class signupfirst extends StatelessWidget{

   var controller= Get.find<ProfileProviderController>();
   var controller1= Get.find<TasksController>();
     var controller2= Get.find<HomeController>();

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
                                text: ' As User',
                                width: 270,
                                onPressed: () async{
                                    Securestorage storage=new Securestorage();
                                    // await storage.delete('token_provider');
                                   
                                    Url.Token_user=await storage.read('token_user') ;
                                     
                                      Url.saved_id_user=await storage.read('id_user') ;
                                      print("id userrrr ${Url.saved_id_user}");
                                       if(  Url.Token_user==""){

                                         Get.to(signorlogin());
                                }
                                else{
                                  if(controller2.category.categories.length==0)
                                   {
                                    await controller2.GetCategories();
                                   }
                                    Get.toNamed('/home');
                                }

                                }
            
                              ),
            
                              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                                B_Button(
                                hight: 40,
                                text: ' As Provider',
                                width: 270,
                                onPressed: () async{

                                      Securestorage storage=new Securestorage();
                                    // await storage.delete('token_provider');
                                   String token_regester=await storage.read('token_prov_reg') ;
                                    String token_login=await storage.read('token_provider') ;
                                    Url.Token_prov=await storage.read('token_provider') ;
                                     Url.saved_id_prov_reg=await storage.read('id_prov_reg') ;
                                      Url.saved_id_prov=await storage.read('id_provider') ;
                                    print(token_login);
                                   if(token_login==""){
                                       if(token_regester==""){
                                      print(token_regester);
                                      
                                      //  Get.to(signorlogin_prov());
                                     Get.to(loginprovider());
                                   }
                                      else {
                                     print(token_regester);
                                     Url.saved_id_prov_reg=await storage.read('id_prov_reg') ;
                                   
                                    await controller.fetchProfileProvider();
                                    print("active is ${controller.profile.value.is_active}");
                                       print("id prov is ${ Url.saved_id_prov_reg}");
                                    if(controller.profile.value.is_active==0)
                                       Get.toNamed('/wait');
                                    else if(controller.profile.value.is_active==1){print("is active");
                                         Get.toNamed('/accept');
                                    }
                                    else print("failed ...");
                                  }

                                   }
                                   
                                   else{
                                   Url.saved_id_prov=await storage.read('id_provider');
                                   if(controller1.task.myTasks.name=="")
                                      {await controller1.GetTasks();
                                      }
                                        Get.offAllNamed('/tasks');

                                }}
                                //    Securestorage storage=new Securestorage();
                                //   //  await storage.delete('token_prov_reg');
                                //    String token=await storage.read('token_prov_reg') ;

                                //    print(token);
                                //    if(token==""){
                                //       print(token);
                                //      Get.to(registerprovider());
                                //    }
                                 

                                //   else {
                                //      print(token);
                                //      Url.saved_id_prov_reg=await storage.read('id_prov_reg') ;
                                    
                                //     controller.fetchProfileProvider();
                                //     if(controller.profile.value.is_active==0)
                                //        Get.offNamed('/wait');
                                //     else if(controller.profile.value.is_active==1){print("is active");
                                //          Get.offNamed('/accept');
                                //     }
                                //     else print("failed ...");
                                //   }
                                // },
            
            
                              ),
                  
                              
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
//  SafeArea(
//                         child:



//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(height: MediaQuery.of(context).size.height*0.1,),
//                             GradientText(
//                               'Sign Up ',
//                               style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
//                               gradient: LinearGradient(colors: [
//                                 darkbeige,
//                                 pink,
//                               ]),
//                             ),
//                             SizedBox(height: MediaQuery.of(context).size.height*0.09,),
//                             Basic_Button(
//                               hight: 40,
//                               text: 'As User',
//                               width: 270,
//                               onPressed: () {
//                                 Get.to(registeruser());
//                               },


//                             ),

//                             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          

//                                   B_Button(
//                               hight: 40,
//                               text: 'Sign in',
//                               width: 270,
//                               onPressed: () {
//                                   Get.to(login());
//                               },


//                             ),
//                   ],
//                 ),
//               ),