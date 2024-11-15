import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';

import 'package:new_proj/controller/providers_controller.dart';
import 'package:new_proj/controller/show_provider_controller.dart';
import 'package:new_proj/view/widget/button.dart';

import '../../consts/url.dart';





// ignore: must_be_immutable
class provider_card extends StatelessWidget {
  int index;
  provider_card (this.index);
//  final ProfileProviderController controller = Get.put(ProfileProviderController());
 var controller1 = Get.find<ProvidersController>();
 var controller= Get.find<ShowProviderController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
         },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 150,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 130,
              width: 130,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                            color: Colors.grey.shade200, // لون خلفية التبويب
                            borderRadius: BorderRadius.circular(10.0),
                            image: controller1.prov.providers[index].profileImageUrl==null? DecorationImage(
                      image:
                          AssetImage('assets/images/default.png',),
                      fit: BoxFit.cover):
                     DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${controller1.prov.providers[index].profileImageUrl}',),
                      //     AssetImage('assets/images/bouqet.png',),
                      // fit: BoxFit.cover,
                    fit: BoxFit.cover
                          // شكل الحواف
                          ),)
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "${controller1.prov!.providers[index].name}",
                      style: TextStyle(
                          fontFamily: 'OleoScript',
                        overflow: TextOverflow.ellipsis,
                        color: darkbeige,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                     "${controller1.prov!.providers[index].email}",
                      style: TextStyle(
                          fontFamily: 'OleoScript',
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                        color: darkbeige,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     Button(
                  onPressed: () async{
                   Url.show_id_provider =controller1.prov.providers[index].id;
        await controller.showproviderProfiles();
         Get.toNamed('/showprovider');
                      },
                    
                  text: "Info",
                  hight: 30,
                  width: 100,
                  color: pink,
                ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 0, top: 10),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 40,
                    //         width: 75,
                    //         margin: const EdgeInsets.all(0.2),
                    //         decoration: BoxDecoration(
                    //           color: kPrimaryColor,
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             " ${offer.valueInBonus.toString()} Points",
                    //             style: TextStyle(
                    //               overflow: TextOverflow.ellipsis,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.white,
                    //               fontSize: 12,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 5,
                    //       ),
                    //       Container(
                    //         height: 40,
                    //         width: 75,
                    //         margin: const EdgeInsets.all(0.2),
                    //         decoration: BoxDecoration(
                    //           color: kPrimaryColor,
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             " ${offer.valueInGems.toString()} Gems",
                    //             style: TextStyle(
                    //               overflow: TextOverflow.ellipsis,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.white,
                    //               fontSize: 12,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       // IconButton(
                    //       //   onPressed: () {},
                    //       //   icon: Icon(
                    //       //     Icons.edit,
                    //       //     size: 25,
                    //       //     color: Colors.blueAccent,
                    //       //   ),
                    //       // ),
                    //       // IconButton(
                    //       //   onPressed: () {},
                    //       //   icon: Icon(
                    //       //     Icons.delete_forever,
                    //       //     size: 25,
                    //       //     color: Colors.red,
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //   /* Row(
            //       children: [*/
            //         IconButton(
            //           onPressed: () {

            //           },

            //             icon: Icon(
            //               Icons.create,
            //               size: 20,
            //               color: Colors.red,
            //             ),
            //           ),

            //     IconButton(
            //       onPressed: () {

            //       },
            //       icon: Icon(
            //         Icons.delete,
            //         size: 20,
            //         color: kPrimaryColor,
            //       ),
            //     ),
            //      IconButton(
            //           onPressed: () {
            //           },
            //             icon: Icon(
            //               Icons.thumb_up_alt_rounded,
            //               size: 20,
            //               color: Colors.blueAccent,
            //             ),
            //           ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
