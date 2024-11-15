import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';



import 'package:new_proj/view/widget/text.dart';

import '../../controller/search_product_controller.dart';

// ignore: must_be_immutable
class Product_search_card extends StatelessWidget {
int index;
  var controller = Get.find<SearchProductController>();
  Product_search_card(this.index);  

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Url.id_product =controller.productList[index].id;
          Get.toNamed('/ProductDetails');},
        child: Container(
            width:MediaQuery.of(context).size.width *0.42 ,
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
                  color: Colors.grey.shade200, // لون خلفية التبويب
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: controller.productList[index].image != null && controller.productList[index].image !.isNotEmpty
                    ? Image.network(
                  '${Url.domain}${controller.productList[index].image}',
                  width: 180,
                  height: 180,   
                  fit: BoxFit.cover,
                )
                    : Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.white,
                ),

              ),
              Stack(
                children: [
                  Row(
                    children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    TextUtils(text: '${controller.productList[index].name}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      underLine: TextDecoration.none,),
                    TextUtils(text: '${controller.productList[index].price}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      underLine: TextDecoration.none,)
                  ],
                ),
                //  SizedBox(width: MediaQuery.of(context).size.width*0.075,),

              ],),
                Positioned(
                  right:5,
                  child: IconButton(
                    onPressed: () {

                    },
                    //  Get.toNamed('/points'),
                    icon: Icon(Icons.shopping_cart),
                    color: darkbeige,
                    iconSize: 23,
                  ),
                ),
              ],

              )
            ],)

        ));
  }
}