import 'package:flutter/material.dart';


import 'package:new_proj/models/category_model.dart';

import 'package:new_proj/view/widget/product.dart';
import 'package:new_proj/view/widget/text.dart';





// ignore: must_be_immutable
class collection extends StatelessWidget {
  Category cat;
  int id;
  collection(this.cat ,this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(children: [
           Padding(
             padding: const EdgeInsets.only(right: 160,bottom: 15),
             child: TextUtils(
              fontfamily:'OleoScript',
              maxline: 1,
              text: '  ${cat.collections[id].name}',  fontSize:17,fontWeight: FontWeight.normal,
                          color: Colors.black54,
                           underLine: TextDecoration.none,
                           ),
           ),

                         SizedBox(
                  height: MediaQuery.of(context).size.height *0.25,
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 10),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Product_card(cat,cat.collections[id].products[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemCount:cat.collections[id].products.length
                      ),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    
        ],),
      
    );
  }
}
