import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';

import 'package:new_proj/models/flowers_model.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../consts/url.dart';

// ignore: must_be_immutable
class flower_card extends StatelessWidget {
 Product_flo flo;
  int id;
  int index1;
  flower_card(this.id,this.index1,this.flo);
var controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { openDialog(context);
      },
      child: Container(
                            width:MediaQuery.of(context).size.width *0.43  ,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // لون خلفية التبويب
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                    color: darkbeige,
                    width: 1,
                  ),
                          // شكل الحواف
                          ),
                          child:Column(children: [
                            Container(
                            width:MediaQuery.of(context).size.width  ,
                            height: MediaQuery.of(context).size.height *0.15,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // لون خلفية التبويب
                            borderRadius: BorderRadius.circular(10.0),
                            image: flo.image==null? DecorationImage(
                      image:
                          AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover):
                     DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${flo.image}'),
                      //     AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover,
                    
                          // شكل الحواف
                          ),)
                          ),
                         
                            Column(
                              children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                               TextUtils(text: '${flo.name}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                                                            color: Colors.black54,
                                                             underLine: TextDecoration.none,),
                                
                                TextUtils(text: '${flo.price}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                          color: Colors.black54,
                           underLine: TextDecoration.none,)    
                              ],
                            ),
                             SizedBox(width: MediaQuery.of(context).size.width*0.075,),
                          //    IconButton(
                          //   onPressed: () {
                            
                          //   },
                          //   //  Get.toNamed('/points'),
                          //   icon: Icon(Icons.shopping_cart),
                          //   color: darkbeige,
                          //   iconSize: 23,
                          // ),
                          ],)
                          
                          //  Text('${cat.collections[id].products[index].name}', style: TextStyle(color: Colors.white)), // نص التبويب
                        ));
  }
void openDialog(BuildContext context) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      SizedBox(
        // width: 1000,
        child: AlertDialog(
          backgroundColor: Colors.white ,
           insetPadding: EdgeInsets.symmetric(vertical: 120,horizontal:0 ),
           
          // titlePadding: EdgeInsets.only(top: 0,bottom: 0, left: 170),
          // title: TextUtils(
          //     fontSize: 17,
          //     fontWeight: FontWeight.normal,
          //     text: "",
          //     color: Colors.black,
          //     underLine: TextDecoration.none),
          
          content: SizedBox(
          width: double.infinity, // جعل عرض الـ dialog يمتد على عرض الشاشة
          child: SingleChildScrollView(
            child: Column(children: [   SizedBox(height: 10,),
            Row(
              children: [
                Container(
                                              height: MediaQuery.of(context).size.height *0.2,
                                              width: MediaQuery.of(context).size.width *0.35,
                                              margin: const EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  
                                                        image:controller.flowers.products[index1].image==null? 
                            DecorationImage(image:  AssetImage('assets/images/bouqe.png',),
                        fit: BoxFit.cover):
                      DecorationImage( image :NetworkImage('${Url.domain}' +
                          '${controller.flowers.products[index1].image}'),
                            fit: BoxFit.cover,),
                        //     AssetImage('assets/images/bouqet.png',),
                      
                      
                            // شكل الحواف
                            
                                                      //       AssetImage('assets/images/bouqe.png',),
                                                      //    fit: BoxFit.fill,
                                                      // ),
                                                      )),
                                                      Column(children: [Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: TextUtils(
                                                                                    fontSize: 23,
                                                                                              fontWeight: FontWeight.bold,
                                                                                           
                                                                                              text: '${   controller.flowers.products[index1].name}',
                                                                                              color: pink,
                                                                                              underLine: TextDecoration.none,
                                                                                  fontfamily: 'OleoScript',
                                                                                                           ),
                                                      ),
                                                     SizedBox(height: 10,),
                                                      Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 25,
                                          height:25,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(2),
                                            ),
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Colors.redAccent,
                                                //  spreadRadius: 2.0,
                                                blurRadius: 0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                          controller.quantity_flower.value++;
                                            //  Get.back();
                    
                                            print('quntjlkity');
                                            print(controller.quantity_flower.value);
                                          },
                                          icon: Icon(Icons.add,color: Colors.black,size: 18),
                                          color: Colors.brown,
                                        ),
                                      ],
                                    ),
                                   Obx(() =>  TextUtils(fontSize:16,
                                      fontWeight: FontWeight.bold,
                                      text: controller.quantity_flower.value>0?'0${controller.quantity_flower.value}':'01',
                                      //'0${controller.quantity.value}'
                                      color: Colors.black ,
                                      underLine: TextDecoration.none,
                                      //fontfamily: 'OleoScript',
                                    ),),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 25,
                                          height:25,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(2),
                                            ),
                                            color: Colors.white,
                                            boxShadow:[
                                              BoxShadow(
                                                color: Colors.redAccent,
                                                //  spreadRadius: 2.0,
                                                blurRadius: 0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            controller.quantity_flower.value--;
                                            //  Get.back();
                                            print('quntjlkity');
                                            print(controller.quantity_flower.value);
                                          },
                                          icon: Icon(Icons.minimize_sharp,color: Colors.black,size: 18),
                                          color: Colors.brown,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
            
                                                     ],)
              ],
            ),
                          
                                                     SizedBox(height: 30,),
                                                       Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width *0.7 ,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                               
              
                                return  
                               Obx(()=>
                                  InkWell(
                                    onTap: () {
                                     controller. current_size.value=index; 
                                     controller.size= controller.flowers.products[index1].size[index];
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Container(
                                        width: 70,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: 
                                          // controller.current.value == size
                                          //     ? Colors.brown.withAlpha(80)
                                          //     :
                                               Colors.white.withAlpha(20),
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                            color: controller.current_size.value==index ? pink: Colors.black26,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: TextUtils(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          text: '${  controller.flowers.products[index1].size[index]}',
                                          color: controller.current_size.value==index ? pink: Colors.black26,
                                          underLine: TextDecoration.none,
                                          fontfamily: 'OleoScript',
                                        ),
                                      ),
                                    ),
                                  ),
                               );
                              },
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 5,
                              ),
                              itemCount: controller.flowers.products[index1].size.length
                            ),
                        ),
                      ),
                         SizedBox(height: 20,),
                         TextUtils(
                              fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        text: '${   controller.flowers.products[index1].description}',
                                        color: beige,
                                        underLine: TextDecoration.none,
                            fontfamily: 'OleoScript',
                                                     ),
                                                     SizedBox(height: 20,),
                        
                         TextUtils(
                              fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        text: '${   controller.flowers.products[index1].price} \$',
                                        color: beige,
                                        underLine: TextDecoration.none,
                            fontfamily: 'OleoScript',
                                                     ),
                                                      SizedBox(height: 20,),
                                                    
            
                        
                         RatingBar.builder(
                            
                initialRating: controller.flowers.products[index1].rate.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 6,
                itemSize: 25,
                unratedColor: Colors.grey.shade300,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  // تحديث التقييم عند تغيير النجمة
                  // rating = value;
                },
              ),
               SizedBox(height: 20,),
                       
                         Button(
                      onPressed: () {
                        if(controller.size==""){
                          EasyLoading.showError("please choose product size");
                        }
                      // await  controller.AddToCart_2(id);
                    else{controller.products.add(flo);
                      controller.quantities_flower.add(controller.quantity_flower.value);
                      print( controller.products);
                      EasyLoading.showSuccess("product added to the bouqet successfully");
                      Navigator.of(context).pop();
                       controller.isDialogOpen.value = false;}  
                          },
                        
                      text: "Add ",
                      hight: 40,
                      width: 50,
                      color: deeppink,
                    ),],),
          )
          
          // actions: [
          //   Center(
          //     child: Button(
          //       onPressed: () async {
                 
          //       },
          //       text: "ارسال",
          //       hight: 50,
          //       width: 200,
          //     ),
          //   ),
          //   SizedBox(
          //     height: 20,
          //   )
          // ],
        ),),
      ),
      barrierDismissible: false,
    );
  }
}