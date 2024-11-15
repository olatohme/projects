
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';

import 'package:new_proj/controller/transaction_controller.dart';
import 'package:new_proj/view/widget/text.dart';

import 'package:new_proj/view/widget/transaction_card.dart';





class transaction_screen extends StatelessWidget{
   var controller = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
 Column(children: [
              controller.transactions.length==0?
                      Padding(
                        padding: const EdgeInsets.only(top: 450),
                        child: Center(child: Text('There are no Transactions points')),
                      ): 
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                         Row(
                           children: [
                             IconButton(
                          onPressed: () {
                           Get.back();
                          },
                          //  Get.toNamed('/points'),
                          icon: Icon(Icons.chevron_left),
                          color: darkbeige,
                          iconSize: 25,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                             TextUtils(text: 'View the transactions that took place \n    on your points :',  fontfamily: 'OleoScript',fontSize:20,fontWeight: FontWeight.w100,
                                color: Colors.black54,
                                 underLine: TextDecoration.none,),
                           ],
                         ),
                             const SizedBox(
                              height: 20,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return  transaction_card(index);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount:controller.transactions.length
                        ),
                      ),
            ],),
       
          
        ),
      

    );

  }
}