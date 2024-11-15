// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:untitled2/consts/colors.dart';
// import 'package:untitled2/controller/home_controller.dart';
// import 'package:untitled2/view/widget/text.dart';



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/home_controller.dart';
import 'package:new_proj/view/widget/text.dart';

// ignore: must_be_immutable
class drawer extends StatelessWidget {

  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                      children: [
                        // SizedBox(
                        //   width: 5,
                        // ),
                     IconButton(
                        onPressed: () {
                          controller.zoomcontroller.close!();
                        },
                        //  Get.toNamed('/points'),
                        icon: Icon(Icons.chevron_left),
                        color: darkbeige,
                        iconSize: 20,
                      ),
                      // SizedBox(width: 10,),
                         Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(100),
                 image: DecorationImage(
                  image:
                      AssetImage('assets/images/profile.png',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10,),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "John ",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                    SizedBox(
                    height: 50,
                  ),
             
                  // Divider(
                  //   color: Colors.white,
                  //   height: 1,
                  // ),
                  // ListTile(
                  //   title: TextUtils(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //     text: "ملفي الشخصي",
                  //     color: Colors.black,
                  //     underLine: TextDecoration.none,
                  //   ),
                  //   onTap: () {
                  //    controller.zoomcontroller.close!();
                    
                  //   },
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: isclick_add == true ? white : kPrimaryColor
                        ),
                    width: MediaQuery.of(context).size.width*0.45,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.account_box_rounded,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 30,
                        ),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "profile",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                  ),
                      Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: isclick_add == true ? white : kPrimaryColor
                        ),
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.group,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 30,
                        ),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "Providers",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                  ),
                      Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: isclick_add == true ? white : kPrimaryColor
                        ),
                    width: MediaQuery.of(context).size.width*0.45,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.task_alt_rounded,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 30,
                        ),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "Tasks",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                  ),    Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: isclick_add == true ? white : kPrimaryColor
                        ),
                    width: MediaQuery.of(context).size.width*0.45,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.phone
                        ,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 30,
                        ),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "Contact",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: isclick_add == true ? white : kPrimaryColor
                        ),
                    width: MediaQuery.of(context).size.width*0.45,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.settings,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 30,
                        ),
                      TextUtils(
         color: Color.fromRGBO(133, 88, 51, 1),
        text: "Setting",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        
        fontfamily: 'OleoScript',
        underLine: TextDecoration.none,
      ),
                      ],
                    ),
                  ),
      //                 Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: Colors.white,
      //                     width: 2,
      //                   ),
      //                   // color: isclick_add == true ? white : kPrimaryColor
      //                   ),
      //               width: 100,
      //               height: 50,
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                    width: 10,
      //                   ),
      //                   Icon(Icons.add_box_rounded,color: darkbeige),
      //                       // color: isclick_add == true ? kPrimaryColor : white),
      //                   SizedBox(
      //                     width: 25,
      //                   ),
      //                 TextUtils(
      //   color: Colors.white,
      //   text: "profile",
      //   fontSize: 18,
      //   fontWeight: FontWeight.bold,
        
      //   fontfamily: 'OleoScript',
      //   underLine: TextDecoration.none,
      // ),
      //                 ],
      //               ),
      //             ),
      //                 Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: Colors.white,
      //                     width: 2,
      //                   ),
      //                   // color: isclick_add == true ? white : kPrimaryColor
      //                   ),
      //             width: 100,
      //               height: 50,
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   Icon(Icons.add_box_rounded,color: darkbeige),
      //                       // color: isclick_add == true ? kPrimaryColor : white),
      //                   SizedBox(
      //                     width: 25,
      //                   ),
      //                 TextUtils(
      //   color: Colors.white,
      //   text: "profile",
      //   fontSize: 18,
      //   fontWeight: FontWeight.bold,
        
      //   fontfamily: 'OleoScript',
      //   underLine: TextDecoration.none,
      // ),
      //                 ],
      //               ),
      //             ),
      //                 Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: Colors.white,
      //                     width: 2,
      //                   ),
      //                   // color: isclick_add == true ? white : kPrimaryColor
      //                   ),
      //       width: 100,
      //               height: 50,
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   Icon(Icons.add_box_rounded,color: darkbeige),
      //                       // color: isclick_add == true ? kPrimaryColor : white),
      //                   SizedBox(
      //                     width: 25,
      //                   ),
      //                 TextUtils(
      //   color: Colors.white,
      //   text: "profile",
      //   fontSize: 18,
      //   fontWeight: FontWeight.bold,
        
      //   fontfamily: 'OleoScript',
      //   underLine: TextDecoration.none,
      // ),
      //                 ],
      //               ),
      //             ),
      //                 Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: Colors.white,
      //                     width: 2,
      //                   ),
      //                   // color: isclick_add == true ? white : kPrimaryColor
      //                   ),
      //             width: 100,
      //               height: 50,
      //               child: Row(
      //                 children: [
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   Icon(Icons.add_box_rounded,color: darkbeige),
      //                       // color: isclick_add == true ? kPrimaryColor : white),
      //                   SizedBox(
      //                     width: 25,
      //                   ),
      //                 TextUtils(
      //   color: Colors.white,
      //   text: "profile",
      //   fontSize: 18,
      //   fontWeight: FontWeight.bold,
        
      //   fontfamily: 'OleoScript',
      //   underLine: TextDecoration.none,
      // ),
      //                 ],
      //               ),
      //             ),
                  // Divider(
                  //   color: Colors.white,
                  //   height: 1,
                  // ),
                  // ListTile(
                  //     title: TextUtils(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold,
                  //       text: "السجل ",
                  //       color: Colors.white,
                  //       underLine: TextDecoration.none,
                  //     ),
                  //     onTap: () {
                      
                  //     }),
                 
                  // Divider(
                  //   color: Colors.white,
                  //   height: 1,
                  // ),
                   ])
    );
  }
}



// class MyHomePage extends StatelessWidget {
//   var  controller = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
     
//      return SafeArea(
//         child: Scaffold(
//           body: Stack(
//                 children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: darkbeige.withOpacity(0.5),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 70),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
                 
//                   SizedBox(
//                     height: 40,
//                   ),
             
//                   Divider(
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                   ListTile(
//                     title: TextUtils(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       text: "ملفي الشخصي",
//                       color: Colors.white,
//                       underLine: TextDecoration.none,
//                     ),
//                     onTap: () {
                     
                    
//                     },
//                   ),
//                   Divider(
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                   ListTile(
//                       title: TextUtils(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         text: "السجل ",
//                         color: Colors.white,
//                         underLine: TextDecoration.none,
//                       ),
//                       onTap: () {
                      
//                       }),
                 
//                   Divider(
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                   ListTile(
//                       title: TextUtils(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         text: "انشاء حساب",
//                         color: Colors.white,
//                         underLine: TextDecoration.none,
//                       ),
//                       onTap: () {
                        
//                       }),
//                   Divider(
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                   ListTile(
//                       title: TextUtils(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         text: "تسجيل خروج",
//                         color: Colors.white,
//                         underLine: TextDecoration.none,
//                       ),
//                       onTap: () {
                       
//                       }),
//                   Divider(
//                     color: Colors.white,
//                     height: 1,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Obx(() {
//             return AnimatedPositioned(
//               duration: Duration(milliseconds: 850),
//               top: controller.isCollapsed.value
//                   ? 0
//                   : 0 * MediaQuery.of(context).size.height,
//               bottom: controller.isCollapsed.value
//                   ? 0
//                   : 0 * MediaQuery.of(context).size.height,
//               left: controller.isCollapsed.value
//                   ? 0
//                   : 0.5 * MediaQuery.of(context).size.width,
//               right: controller.isCollapsed.value
//                   ? 0
//                   : -0.5 * MediaQuery.of(context).size.width,
//               child: Scaffold(
//                  body: SingleChildScrollView(
//                   child: Container(
//                     child: Column(children: [
                      
                         
//                                 Row(
//                                   children: [
                                    
                                       
//                                         IconButton(
//                                           iconSize: 35,
//                                           icon: Icon(Icons.menu),
//                                           color: Colors.black,
//                                           onPressed: () async {
                                           
//                                               controller.isCollapsed(
//                                                   !controller.isCollapsed.value);
//                                             //   print(controller.isCollapsed.value);
//                                             //   print("number is:${controller1.n}");
//                                             //   print(
//                                             //       "${controller1.profile!.nickName.toString()}");
//                                             //   print("${controller4.offers.length}");
//                                             //   print(controller1.tokencustomer);
//                                           },
//                                         ),
//                                ] )
//                                ] ),
//                   )
//              )
//              )
             
//              );
             
//              }),]),
//         ));

//     // Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('             '),
//     //      actions: [
//     //       IconButton(
//     //         icon: Icon(Icons.search),
//     //         onPressed: () {
//     //           // الإجراء المطلوب عند النقر على أيقونة البحث
//     //         },
//     //       ),
//     //       IconButton(
//     //         icon: Icon(Icons.settings),
//     //         onPressed: () {
//     //           // الإجراء المطلوب عند النقر على أيقونة الإعدادات
//     //         },
//     //       ),
//     //     ],
//     //   ),
//     //   body: Center(
//     //     child: ElevatedButton(
//     //       onPressed: controller.toggleDrawer,
//     //       child: Text('Toggle Drawer'),
//     //     ),
//     //   ),
//     //   drawer:  Drawer(
//     //     child:Container(
//     //         width: MediaQuery.of(context).size.width*0.6,
//     //         height: MediaQuery.of(context).size.height /2,
//     //           child: ListView(
//     //             padding: EdgeInsets.zero,
//     //             children: <Widget>[
//     //              Row(
//     //                   children: [
//     //                       IconButton(
//     //                         onPressed: () {
//     //                         Get.back();
//     //                         },
//     //                         //  Get.toNamed('/points'),
//     //                         icon: Icon(Icons.list),
//     //                         color: darkbeige,
//     //                         iconSize: 28,
//     //                       ), 
                      
//     //                   ],
//     //                 ),
                 
//     //               ListTile(
//     //                 leading: Icon(Icons.settings),
//     //                 title: Text('Settings'),
//     //                 onTap: () {
//     //                   // أضف الإجراء المطلوب هنا عند النقر على العنصر في الـ Drawer
//     //                   Get.back(); // لإخفاء الـ Drawer بعد النقر
//     //                 },
//     //               ),
//     //               ListTile(
//     //                 leading: Icon(Icons.info),
//     //                 title: Text('About'),
//     //                 onTap: () {
//     //                   // أضف الإجراء المطلوب هنا عند النقر على العنصر في الـ Drawer
//     //                   Get.back(); // لإخفاء الـ Drawer بعد النقر
//     //                 },
//     //               ),
//     //             ],
//     //           ),
//     //         ))
          
//     // );
//   }
//   }