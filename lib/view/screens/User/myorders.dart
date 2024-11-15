
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_success_controller.dart';

import 'package:new_proj/controller/transaction_controller.dart';
import 'package:new_proj/view/widget/order_card.dart';
import 'package:new_proj/view/widget/text.dart';

import 'package:new_proj/view/widget/transaction_card.dart';





class myorders extends StatelessWidget{
   var controller = Get.find<OrderSuccessController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
       LiquidPullToRefresh(
                  onRefresh:_handleRefresh,
              color: Colors.transparent,
              height: 100,
              backgroundColor: Colors.white,
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
                child:  SingleChildScrollView(
                  child:
 Container(
  width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height,
   child:   Column(children: [
              
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
                          SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                               TextUtils(text: 'My Orders :',  fontfamily: 'Kings',fontSize:30,fontWeight: FontWeight.w100,
                                  color: beige,
                                   underLine: TextDecoration.none,),
                             ],
                           ),
                               const SizedBox(
                                height: 20,),
                                Obx(()=>
                                                      controller.isLoading.value?
                                                                        
                                
                     Center(child: CircularProgressIndicator()):
                                  controller.orders.orders.length==0?
                        Padding(
                          padding: const EdgeInsets.only(top: 450),
                          child: Center(child: Text('There are no Orders')),
                        ): 
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return  order_card(index);
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                            itemCount:controller.orders.orders.length
                          ),
                        )
  
              
 
 )
 ]),
 
       
          
        ),
                )))

    );

  }

  Future<void>_handleRefresh() async{
              print("refresh");
  controller.isLoading.value=true;
  await controller.GetOrders();
  print("orders");
  

  return await Future.delayed(const Duration(seconds:1));
}
}