import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';

import 'package:new_proj/controller/providers_controller.dart';
import 'package:new_proj/controller/show_provider_controller.dart';
import 'package:new_proj/controller/transaction_controller.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../consts/url.dart';





// ignore: must_be_immutable
class transaction_card extends StatelessWidget {
  var controller = Get.find<TransactionController>();
  int index;
  transaction_card (this.index);
//  final ProfileProviderController controller = Get.put(ProfileProviderController());
 
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 160,
        width: 100,
        decoration: BoxDecoration(
          color:   Color.fromRGBO( 211, 179, 152 ,0.5),
          borderRadius: BorderRadius.circular(17),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 3.0,
          //     blurRadius: 5.0,
          //   ),
          // ],
        ),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding: const EdgeInsets.only(left: 40),
             child: TextUtils(text: '${controller.transactions[index].type} transaction',  fontfamily: 'OleoScript',fontSize:20,fontWeight: FontWeight.normal,
                              color: pink,
                               underLine: TextDecoration.none,),
           ),
                             const SizedBox(
                              height: 20,),

                               Padding(
                                 padding: const EdgeInsets.only(left: 40),
                                 child: Row(
                                   children: [
                                     TextUtils(text: '${controller.transactions[index].points} ',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                                                                 color:Colors.green.shade800,
                                                                  underLine: TextDecoration.none,),
                                                                  SizedBox(width: 300,
                                                                    child: TextUtils(maxline: 2,
                                                                      text: ' ${controller.transactions[index].description}',  fontfamily: 'OleoScript',fontSize:15,fontWeight: FontWeight.normal,
                                                                                                                                     color: Colors.black54,
                                                                    underLine: TextDecoration.none,),
                                                                  ),
                                   ],
                                 ),
                               ),
                             const SizedBox(
                              height: 20,),
                            
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: TextUtils(text: '${controller.transactions[index].createdAt} ',  fontfamily: 'OleoScript',fontSize:13,fontWeight: FontWeight.normal,
                                                            color: Colors.black45,
                                                             underLine: TextDecoration.none,),
                              ),
                             const SizedBox(
                              height: 20,),

         ],)
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       height: 130,
        //       width: 130,
        //       margin: const EdgeInsets.only(left: 10),
        //       decoration: BoxDecoration(
        //                     color: Colors.grey.shade200, // لون خلفية التبويب
        //                     borderRadius: BorderRadius.circular(10.0),
        //                     image: controller1.prov.providers[index].profileImageUrl==null? DecorationImage(
        //               image:
        //                   AssetImage('assets/images/default.png',),
        //               fit: BoxFit.cover):
        //              DecorationImage(
        //                 image: NetworkImage('${Url.domain}' +
        //                 '${controller1.prov.providers[index].profileImageUrl}',),
        //               //     AssetImage('assets/images/bouqet.png',),
        //               // fit: BoxFit.cover,
        //             fit: BoxFit.cover
        //                   // شكل الحواف
        //                   ),)
        //     ),
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     Expanded(
        //       flex: 10,
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 30),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           // ignore: prefer_const_literals_to_create_immutables
        //           children: [
        //             Text(
        //               "${controller1.prov!.providers[index].name}",
        //               style: TextStyle(
        //                   fontFamily: 'OleoScript',
        //                 overflow: TextOverflow.ellipsis,
        //                 color: darkbeige,
        //                 fontSize: 17,
        //                 fontWeight: FontWeight.normal,
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 15,
        //             ),
        //             Text(
        //              "${controller1.prov!.providers[index].email}",
        //               style: TextStyle(
        //                   fontFamily: 'OleoScript',
        //                 overflow: TextOverflow.ellipsis,
        //                 fontWeight: FontWeight.normal,
        //                 color: darkbeige,
        //                 fontSize: 16,
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 15,
        //             ),
        //              Button(
        //           onPressed: () async{
        //            Url.show_id_provider =controller1.prov.providers[index].id;
        // await controller.showproviderProfiles();
        //  Get.toNamed('/showprovider');
        //               },
                    
        //           text: "Info",
        //           hight: 30,
        //           width: 100,
        //           color: pink,
        //         ),
            
        //           ],
        //         ),
        //       ),
        //     ),

     
        //   ],
        // ),
      
    );
  }
}
