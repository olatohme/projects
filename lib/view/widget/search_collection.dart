import 'package:flutter/material.dart';


import 'package:new_proj/models/search_collection_model.dart';

import 'package:new_proj/view/widget/product_collection.dart';
import 'package:new_proj/view/widget/text.dart';





// ignore: must_be_immutable
class collection_search_card extends StatelessWidget {
 Collection_search collection;
 int index1;
  collection_search_card(this.collection ,this.index1);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(children: [
           Padding(
             padding: const EdgeInsets.only(right: 180,bottom: 15),
             child: TextUtils(text: '${collection.name}',  fontfamily: 'OleoScript',fontSize:17,fontWeight: FontWeight.normal,
                          color: Colors.black54,
                           underLine: TextDecoration.none,),
           ),

                         SizedBox(
                  height: MediaQuery.of(context).size.height *0.25,
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 10),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Product_collection(collection.products[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemCount:collection.products.length
                      ),
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    
        ],),
      
    );
  }
}
