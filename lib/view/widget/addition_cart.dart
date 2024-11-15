import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';
import 'package:new_proj/models/addition_model.dart';

import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../consts/url.dart';

// ignore: must_be_immutable
class addition_card extends StatelessWidget {
  AdditionElement add;
  int id;
  int index;
  addition_card(this.id,this.index,this.add);
var controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        // openDialog(context);
      },
      child: Container(
                            width:MediaQuery.of(context).size.width *0.5 ,
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
                            image: add.imageUrl==null? DecorationImage(
                      image:
                          AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover):
                     DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${add.imageUrl}'),
                      //     AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover,
                    
                          // شكل الحواف
                          ),)
                          ),
                          Row(children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                SizedBox(width: MediaQuery.of(context).size.width *0.37,
                                  child: TextUtils(text: '${add.name}', maxline: 1, fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                                                            color: Colors.black54,
                                                             underLine: TextDecoration.none,),
                                ),
                             SizedBox(width: MediaQuery.of(context).size.width *0.37,
                               child: TextUtils(text: '${add.description}',maxline: 1,  fontfamily: 'OleoScript',fontSize:12,fontWeight: FontWeight.normal,
                                                         color: Colors.black54,
                                                          underLine: TextDecoration.none,),
                             ),
                                TextUtils(text: '${add.price}\$',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                          color: Colors.black54,
                           underLine: TextDecoration.none,)  , 
                           SizedBox(height: 5,),
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
                                        controller.quantity_addition.value++;
                                          //  Get.back();
        
                                          print('quntjlkity');
                                          print(controller.quantity_addition.value);
                                        },
                                        icon: Icon(Icons.add,color: Colors.black,size: 18),
                                        color: Colors.brown,
                                      ),
                                    ],
                                  ),
                                 Obx(() =>  TextUtils(fontSize:14,
                                    fontWeight: FontWeight.w400,
                                    text: controller.quantity_addition.value>0?'0${controller.quantity_addition.value}':'01',
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
                                          controller.quantity_addition.value--;
                                          //  Get.back();
                                          print('quntjlkity');
                                          print(controller.quantity_addition.value);
                                        },
                                        icon: Icon(Icons.minimize_sharp,color: Colors.black,size: 18),
                                        color: Colors.brown,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            
                       Button(
                    onPressed: () async{
                     controller.addition_create.add(add);
                      controller.quantities_addition.add(controller.quantity_flower.value);
                     print( controller.addition_create);
                    EasyLoading.showSuccess("product added to the bouqet successfully");
                   
                        },
                      
                    text: "Add ",
                    hight: 30,
                    width: 50,
                    color: pink,
                  ), 
                              ],
                            ),
                             SizedBox(width: MediaQuery.of(context).size.width*0.075,),
                         
                          ],)
                          ],)
                          //  Text('${cat.collections[id].products[index].name}', style: TextStyle(color: Colors.white)), // نص التبويب
                        ));
  }

}