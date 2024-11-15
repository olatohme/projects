

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';
import 'package:new_proj/view/widget/bouqet_cart.dart';
import 'package:new_proj/view/widget/button.dart';


import 'package:new_proj/view/widget/text.dart';

import '../../../consts/url.dart';


// ignore: must_be_immutable
class bouqets extends StatelessWidget {
    var controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
          SingleChildScrollView(
            child: Obx(() =>   Container(
                 width: MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.height,
                      decoration: ShapeDecoration(
                        gradient: backColor,  shape: RoundedRectangleBorder(
                       
                        ),),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(children: [
                      IconButton(
                        onPressed: () async {
                        
                          // controller.order_load.value=true;
                          // await controller.order();
                         Get.offNamed('/home');
                        },
                        //  Get.toNamed('/points'),
                        icon: Icon(Icons.chevron_left),
                        color: darkbeige,
                        iconSize: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                      Text(
                          " My Bouqets",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                             fontFamily: 'Kings',
                            color: darkbeige,
                            fontSize: 30,
                          ),
                        ),
              
                  ],),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                   
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child:
                    //  Obx(() {
                    //   if (controller1.isloading.isTrue) {
                    //     return Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   }
                    //   return 
                       controller.isLoading_bouq.value?
                     Center(child: CircularProgressIndicator()):
                  controller.bouqets.bouquets.length== 0?
                    Center(child: Text('There are no bouqets ')): ListView.separated(
                      itemBuilder: (context, index) {
                        return bouqet_card(index);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.bouqets.bouquets.length
                    ),),
                  
               
                      ]),
            ),)
          ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: pink,
        onPressed: ()async { 
          openDialog(context);
         },
        // tooltip: 'Increment',
        child: const Icon(Icons.add ,color: white,),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
      ),
    );
  }
  void openDialog(BuildContext context) {
    controller.isDialogbouket.value = true;
    Get.dialog(AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 30),
        
        content: Container(
          height: 250,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 5,
                  // ),
                  IconButton(
                      onPressed: () {
                        //  print("Email is ${controller1.profile!.user.email}");

                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black87,
                        size: 26,
                      )),
                ],
              ),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  fontfamily: 'OleoScript',
                  text: " Design your bouquet with colors and shapes that match your taste :",
                  color: Colors.black54,
                  underLine: TextDecoration.none),
 
              SizedBox(
                height: 30,
              ),
              Button(
                onPressed: () async {
                   
                  //controller.addprod2();
                  
                   if (Url.Token_user == "")
             { Navigator.of(context).pop();
              openDialog(context);
                controller.isDialogbouket.value = false;}
          else {
          print(Url.Token_user);
          if(controller.colors.length==0 || controller.box.boxes.length==0 ||controller.flowers.products.length==0 ||controller.addition.additions.length==0)
    { controller.products=[];  
                                                          controller.addition_create=[];  
                                                          controller.choose_color=false;
                                                          controller.choose_box=false;
                                                            controller.name="";
                               controller.current_b= 100.obs;
      controller.current_c=100.obs;
      controller.order_load.value=false;
    await controller.order();}
    controller.products=[];  
                                                          controller.addition_create=[];  
                                                          controller.choose_color=false;
                                                          controller.choose_box=false;
                                                            controller.name="";
                               controller.current_b= 100.obs;
      controller.current_c=100.obs;
      controller.order_load.value=false;
          Navigator.of(context).pop();
          Get.offNamed('/order');
          
                     controller.isDialogbouket.value = false;}
                },
                color: pink,
                text: "  Create Bouqet",
                hight: 40,
                width: 80,
              ),
               SizedBox(
                height: 10,
              ),
      
            ],
          ),
        )));
  }
}
