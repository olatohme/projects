import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:new_proj/view/widget/addition_cart.dart';
import 'package:new_proj/view/widget/button2.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/card_box.dart';
import 'package:new_proj/view/widget/flower_cart.dart';


import 'package:new_proj/view/widget/text.dart';

// ignore: must_be_immutable
class order extends StatelessWidget {
  

   var controller = Get.find<OrderController>();
 

 
  order({Key? key}) : super(key: key);
  var k=GlobalKey<FormState>();
  // PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return 
       Form(
         key: k,
        child: SingleChildScrollView(
              child:
                // controller.order_load.value?
                // Center(child: CircularProgressIndicator()):
                Obx(()=>
                 controller.order_load.value?
                     Center(child: Column(
                       children: [
                        SizedBox(height: 400,),
                         CircularProgressIndicator(),
                       ],
                     )):
                   
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                          padding: const EdgeInsets.only(left: 0 ,top: 50),
                          child:Row(
                            children: [
                               IconButton(
                          onPressed: () {
                            controller.products=[];  
                                                          controller.addition_create=[];  
                                                          controller.choose_color=false;
                                                          controller.choose_box=false;
                                                            controller.name="";
                               controller.current_b= 100.obs;
      controller.current_c=100.obs;
      controller.order_load.value=false;
//                          controller.choose_box= false;
// controller.choose_color= false;
                           Get.back();
                          },
                          //  Get.toNamed('/points'),
                          icon: Icon(Icons.chevron_left),
                          color: darkbeige,
                          iconSize: 25,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                              TextUtils(
                                    fontSize: 20,
                                              fontWeight: FontWeight.w100,
                                              text: 'Enter the required details to design\n your own bouqet',
                                              color: beige,
                                              underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                                           ),
                            ],
                          ),),
                                                        // SizedBox(height: MediaQuery.of(context).size.height*0.13,),
        
                           Padding(
                             padding: const EdgeInsets.only(left: 40,top :30),
                             child: 
                                   
                                 TextUtils(text: 'enter bouqet name',fontSize:20,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                     color: darkbeige,underLine:
                                     TextDecoration.none),
                              
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 40,right: 100,top: 0),
                             child: CustomTextField(
                               hight: 12,
                               onchange: (value ) { controller.name=value; },
                               hintText: '',
                               width: MediaQuery.of(context).size.width*0.97,
                               obscureText: false,
                               validator: (value ) {
                                 if(value.isEmpty){
                                   return 'bouket name must not be empty';
                                 }
        
        
        
                                 return null;
                               },
        
        
        
        
                             ),
                           ),
                    Padding(
                          padding: const EdgeInsets.only(left: 40 ,top: 30),
                          child:
                              TextUtils(
                                    fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              text: 'choose your box :',
                                              color: beige,
                                              underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                                           ),
                           ),
                    // controller.box.designs.length==0?  
                    // Center(child: TextUtils(
                    //             fontSize: 25,
                    //                       fontWeight: FontWeight.normal,
                    //                       text: ' No Boxes',
                    //                       color: beige,
                    //                       underLine: TextDecoration.none,
                    //           fontfamily: 'OleoScript',
                    //                                    ),):
        
                     Padding(
                          padding: const EdgeInsets.only(left: 40,top: 30,bottom: 30),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height *0.25,
                            child:  
                        
                                                       ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                return   card_box(index);
                                // Container(
                                //   height: 100,
                                //   width: 100,
                                // color: beige,
                                // );
                                },
                                 separatorBuilder: (context, index) => const SizedBox(
                                  width: 10,
                                ),
                                itemCount: controller.box.boxes.length
                
                                  ))
                                  ),
                    // GridView.count(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   crossAxisCount: 2,
                    //   children: List.generate(
                    //     controller.box.boxes.length,
                    //     (index) =>   card_box(index)
                    //   ),
                    // ),
                   Padding(
                          padding: const EdgeInsets.only(left: 40 ),
                          child:
                              TextUtils(
                                    fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              text: 'choose your color :',
                                              color: beige,
                                              underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                                           ),
                         ),
                    
                    Padding(
                          padding: const EdgeInsets.only(left: 50,top: 20),
                          child: SizedBox(
                            height: 30,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  List<int> result = controller.extractRgbValues(controller.colors[index].rgbCode);
                                  // List<String> numbers = controller.colors[index].rgbCode.split(",");
                                  // List<int> result = numbers.map((num) => int.parse(num)).toList();
                
                                  return  
                                   Obx(()=>
                                  InkWell(
                                    onTap: () {
                                      controller.choose_color=true;
                                        controller.current_c.value=index; 
                                        controller.color_id=controller.colors[index].id;
                                    },
                                    child: Container(
                                            height: 40,
                                            width: 30,
                                            margin: const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(result[0],result[1],result[2], 0.7),
                                              // ${controller.colors.color[index].rgbCode},
                                              borderRadius: BorderRadius.circular(100),
                                                border: Border.all(
                                      color: controller.current_c.value==index?pink:Colors.black,
                                      width: 3,
                                    ), 
                                            ),
                                          ),
                                  )
                                   );
                                },
                                separatorBuilder: (context, index) => const SizedBox(
                                  width: 20,
                                ),
                                itemCount:controller.colors.length
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 50 ),
                          child: 
                              TextUtils(
                                    fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              text: 'Choose the types of roses you want to \nadd to your bouquet :',
                                              color: beige,
                                              underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                                           ),
                          ),
                  // 1111111111111111111111111111111111111112222222222222222333333333333333333
                        
                       Padding(
                          padding: const EdgeInsets.only(left: 40,top: 30,bottom: 30),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height *0.28,
                            child:  
                            // controller.flowers.flowers.length==0? Center(child: TextUtils(
                            //     fontSize: 25,
                            //               fontWeight: FontWeight.normal,
                            //               text: ' No Flowers',
                            //               color: beige,
                            //               underLine: TextDecoration.none,
                            //   fontfamily: 'OleoScript',
                            //                            ),): 
                                                       ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {return  flower_card(controller.flowers.products[index].id, index,controller.flowers.products[index]);
                                // Container(
                                //   height: 100,
                                //   width: 100,
                                // color: beige,
                                // );
                                },
                                 separatorBuilder: (context, index) => const SizedBox(
                                  width: 20,
                                ),
                                itemCount:controller.flowers.products.length
                
                                  ))),
        
                   Padding(
                          padding: const EdgeInsets.only(left: 40,top: 50 ),
                          child: 
                              TextUtils(
                                    fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              text: 'Choose the additions you want to \nwith your bouquet :',
                                              color: beige,
                                              underLine: TextDecoration.none,
                                  fontfamily: 'OleoScript',
                                                           ),
                         ),
                        
                       Padding(
                          padding: const EdgeInsets.only(left: 40,top: 30,bottom: 30),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height *0.40,
                            child:  
                            // controller.flowers.flowers.length==0? Center(child: TextUtils(
                            //     fontSize: 25,
                            //               fontWeight: FontWeight.normal,
                            //               text: ' No Flowers',
                            //               color: beige,
                            //               underLine: TextDecoration.none,
                            //   fontfamily: 'OleoScript',
                            //                            ),): 
                                                       ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                return  addition_card(controller.addition.additions[index].id, index,controller.addition.additions[index]);
                                // Container(
                                //   height: 100,
                                //   width: 100,
                                // color: beige,
                                // );
                                },
                                 separatorBuilder: (context, index) => const SizedBox(
                                  width: 20,
                                ),
                                itemCount:controller.addition.additions.length
                
                                  ))
                                  ),
        SizedBox(
                            height: MediaQuery.of(context).size.height *0.05,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 90,right: 90),
                                     child:
                                     B_Button(
                                  hight: 45,
                                  text: 'Create Bouqet',
                                  width: 70,
                                  onPressed: () async{

                                                            
                                                            if(controller.products.length==0){EasyLoading.showError("You must choose at least one product to design your Bouket");}
                                                            if(controller.choose_color==false){EasyLoading.showError("Please choose Box color to create your Bouket");}
                                                            if(controller.name==""){{EasyLoading.showError("Please enter name your Bouket");}}
                                                             if(controller.choose_box==false){EasyLoading.showError("Please choose Box to create your Bouqet");}
                                                             if(controller.name !="" && controller.choose_color==true &&  controller.choose_box==true && controller.products.length>0 ) {
                                                              await controller.Create_bouqet();
                                                         print(controller.bouqets.bouquets.length);
                                                          await controller.GetAllBouqets();
                                                          controller.products=[];  
                                                          controller.addition_create=[];  
                                                          controller.choose_color=false;
                                                          controller.choose_box=false;
                                                          controller.name="";
      
                                                         Get.offNamed('/bouqets');
                                                             
                                                        
                                                           }
                                                        
                                                         
                                   //   Get.to(login());

                                  },


                                ),
                                      // Button(
                                  //                        onPressed: () async{
                                  //                        // 
                                                           
                                  //                            },
                                                           
                                  //                        text: "Create Bouqet ",
                                  //                        hight: 40,
                                  //                        width: 70,
                                  //                        color: Color.fromRGBO(238, 180, 133, 0.705),
                                  //                      ),
                                  ), 
                                   SizedBox(
                            height: MediaQuery.of(context).size.height *0.03,),
                  ],
                ),
                
            ),
      ),
    );
      
  
    
  }
  
}
