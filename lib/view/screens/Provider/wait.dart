import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/profile_provider_controlller.dart';
import 'package:new_proj/view/widget/text.dart';

class Wait extends StatelessWidget {
 var controller= Get.find<ProfileProviderController>();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: 
         
            LiquidPullToRefresh(
                 onRefresh:_handleRefresh,
              color: Colors.transparent,
              height: 100,
              backgroundColor: Colors.white,
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
              // child:
              child:  SingleChildScrollView(child:Container(
                   width: MediaQuery.of(context).size.width,
                        height:  MediaQuery.of(context).size.height,
                        decoration: ShapeDecoration(
                          gradient: backColor,  shape: RoundedRectangleBorder(
                         
                          ),),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                   Container(
              
                      width: 300,
                      height: 300,
              
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:AssetImage("assets/images/R.gif"),
              
                          fit: BoxFit.cover,
                        ),
                        color:Colors.transparent  ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                      //    color: Colors.deepOrangeAccent,
              
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
                       child: TextUtils(text: '         We are currently reviewing your application. You will be notified once your request has been approved by the admin. \n                            Please wait.',  fontfamily: 'OleoScript',fontSize:20
                       ,fontWeight: FontWeight.w200,
                        color: darkbeige,
                        underLine: TextDecoration.none,),
                     ),
              
              
                   ])),

            ))
            )
            );}

            Future<void>_handleRefresh() async{
              print("refresh");

  await controller.fetchProfileProvider();
  print(controller.profile.value.is_active);
  if(controller.profile.value.is_active==1)

  Get.offNamed('/accept');

  return await Future.delayed(const Duration(seconds:1));
}
            }