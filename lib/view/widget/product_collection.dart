import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';


import 'package:new_proj/models/search_collection_model.dart';

import 'package:new_proj/view/widget/text.dart';

// ignore: must_be_immutable
class Product_collection extends StatelessWidget {
  Product_search product;
   

    Product_collection(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        print("id is${product.id}");
        Url.id_product=product.id;
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
                            image: product.image==null? 
                          DecorationImage(image:  AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover):
                    DecorationImage( image :NetworkImage('${Url.domain}' +
                        '${product.image}'),
                          fit: BoxFit.cover,),
                     
                          ),
                          ),
                          Stack(children: [Row(children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Column(
                                children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                  TextUtils(text: '${product.name}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                            color: Colors.black54,
                             underLine: TextDecoration.none,),
                                  TextUtils(text: '${product.price}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
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
                          //  Text('${cat.collections[id].products[index].name}', style: TextStyle(color: Colors.white)), // نص التبويب
                        ));
  }
}