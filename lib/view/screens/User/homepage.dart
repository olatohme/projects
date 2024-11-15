


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:new_proj/consts/url.dart';

import 'package:new_proj/controller/home_controller.dart';
import 'package:new_proj/controller/notification_controller.dart';
import 'package:new_proj/controller/order_controller.dart';
import 'package:new_proj/controller/order_success_controller.dart';
import 'package:new_proj/controller/profile_provider_controlller.dart';
import 'package:new_proj/controller/profile_user_controller.dart';
import 'package:new_proj/controller/search_collection_controller.dart';
import 'package:new_proj/controller/search_product_controller.dart';
import 'package:new_proj/controller/search_provider_controller.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/controller/transaction_controller.dart';
import 'package:new_proj/models/profile_user_model.dart';
import 'package:new_proj/view/screens/User/cart.dart';
import 'package:new_proj/view/screens/User/cart2.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/collection.dart';
import 'package:new_proj/view/widget/product_search_card.dart';
import 'package:new_proj/view/widget/search_collection.dart';
import 'package:new_proj/view/widget/searchformtext.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../../consts/colors.dart';


// ignore: must_be_immutable
class homepage extends StatelessWidget {
  var controller = Get.find<HomeController>();
  var controller2 = Get.find<SearchProductController>();
   var controller3 = Get.find<SearchCollectionController>();
    var controller4 = Get.find<SearchProviderController>();
  var controller5 = Get.find<ProfileUserController>();
  var controller6= Get.find<TransactionController>();
  var controller7= Get.find<OrderSuccessController>();
   var controller8= Get.find<notificationController>();
 
    var controller1 = Get.find<OrderController>();
      GlobalKey _buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
            drawer:   SizedBox(
              width: MediaQuery.of(context).size.width *0.55,
              height: MediaQuery.of(context).size.height*0.9,
              child: Drawer(
              
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),
              topRight: Radius.circular(50)), // تحديد شكل الحواف
                      ),
                // width: MediaQuery.of(context).size.width*0.6,
                // elevation: 500,
                child: Container(
              
              //  height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                        children: [
                          // SizedBox(
                          //   width: 5,
                          // ),
                       IconButton(
                          onPressed: () {
                            Get.back();
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
                  image: controller5.profile.value.image==null? DecorationImage(
                      image:
                      AssetImage('assets/images/default.png',),
                      fit: BoxFit.cover):
                  DecorationImage(
                      image: NetworkImage('${Url.domain}' +
                          '${controller5.profile.value.image}',),
                      //     AssetImage('assets/images/bouqet.png',),
                      // fit: BoxFit.cover,
                      fit: BoxFit.cover
                    // شكل الحواف
                  ),
                ),
              ),
              SizedBox(width: 10,),
                        TextUtils(
                       color: Color.fromRGBO(133, 88, 51, 1),
                      text: "${controller5.profile.value.name}",
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
                    InkWell(
                      onTap: () async {
                          if (Url.Token_user == "")
                             controller.openDialog(context);
                       else {
                           Get.back();
                            controller.isDrawerOpen.value=false;
                             await controller6.GetPoints();
                           await  controller5.getUserProfile();
                        Get.toNamed('profileUser');}
                      },
                      child: Container(
                        decoration: BoxDecoration(


border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            // color: isclick_add == true ? white : kPrimaryColor
                            ),
                        width: MediaQuery.of(context).size.width,
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
                    ),
                       
                        InkWell(onTap: () {
                            Get.back();
                            controller.isDrawerOpen.value=false;
                            controller4.isclick.value=false;
                            
                            Get.toNamed('/providers');
                        },
                          child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          // color: isclick_add == true ? white : kPrimaryColor
                          ),
                      width: MediaQuery.of(context).size.width,
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
                    ),),
                    
                     InkWell(onTap: () {
                       if (Url.Token_user == "")
                             controller.openDialog(context);
                       else {  Get.back();
                            controller.isDrawerOpen.value=false;
                       Get.toNamed('/AddAddress');}

},
                       child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            // color: isclick_add == true ? white : kPrimaryColor
                            ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Icon(Icons.location_on_rounded,color: pink),
                                // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,
                            ),
                          TextUtils(
                         color: Color.fromRGBO(133, 88, 51, 1),
                        text: "Address",
                        fontSize: 18,
                        fontWeight: FontWeight.bold ,
                        
                        fontfamily: 'OleoScript',
                        underLine: TextDecoration.none,
                                           ),
                          ],
                        ),
                                           ),
                     ), 
                     
                      InkWell(onTap: () {
                       if (Url.Token_user == "")
                             controller.openDialog(context);
                       else {  Get.back();
                            controller.isDrawerOpen.value=false;
                             controller7.isLoading.value=false;
                          controller7.GetOrders();
                       Get.toNamed('/myorders');}

},
                       child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            // color: isclick_add == true ? white : kPrimaryColor
                            ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Icon(Icons.fact_check,color: pink),
                                // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,
                            ),
                          TextUtils(
                         color: Color.fromRGBO(133, 88, 51, 1),
                        text: "My Orders",
                        fontSize: 18,
                        fontWeight: FontWeight.bold ,
                        
                        fontfamily: 'OleoScript',
                        underLine: TextDecoration.none,
                                           ),
                          ],
                        ),
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
                      width: MediaQuery.of(context).size.width,
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
                        InkWell(
                          onTap: () {
                              Get.back();
                            controller.isDrawerOpen.value=false;
                            Get.toNamed('/ContactUS');
                          },
                          child: TextUtils(
                                                 color: Color.fromRGBO(133, 88, 51, 1),
                                                text: "Contact",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                
                                                fontfamily: 'OleoScript',
                                                underLine: TextDecoration.none,
                                              ),
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
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Icon(Icons.library_add
                          ,color: pink),
                              // color: isclick_add == true ? kPrimaryColor : white),
                          SizedBox(
                            width: 30,
                          ),
                        InkWell(
                          onTap: () async {
                              Get.back();
                            controller.isDrawerOpen.value=false;
                             await controller6.GetTransaction();
                            Get.toNamed('/transaction');
                          },
                          child: TextUtils(
                                                 color: Color.fromRGBO(133, 88, 51, 1),
                                                text: "Transactions",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                
                                                fontfamily: 'OleoScript',
                                                underLine: TextDecoration.none,
                                              ),
                        ),
                        ],
                      ),
                    ),
              
                    InkWell(
                      onTap: () async{
                        if (Url.Token_user == "")
             { Get.back();
              controller.openDialog(context);
                controller.isDrawerOpen.value = false;}
                          else{
                          Get.back();
                            controller.isDrawerOpen.value=false;
                            if(controller1.bouqets.bouquets.length==0)
                             await controller1.GetAllBouqets();
                        Get.toNamed('/bouqets');}
                      },
                      child: Container(
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
                            Icon(Icons.list,color: pink),
                                // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,
                      
                      
                      ),
                          TextUtils(
                         color: Color.fromRGBO(133, 88, 51, 1),
                        text: "my boukets",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                        fontfamily: 'OleoScript',
                        underLine: TextDecoration.none,
                      ),
                          ],
                        ),
                      ),
                    ),

                        InkWell(
                      onTap: () {
                        if (Url.Token_user == "")
             { Get.back();
              controller.openDialog(context);
                controller.isDrawerOpen.value = false;}
                          else{
                          Get.back();
                            controller.isDrawerOpen.value=false;
                        Get.toNamed('/AddReport');}
                      },
                      child: Container(
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
                            Icon(Icons.edit,color: pink),
                                // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,
                      
                      
                      ),
                          TextUtils(
                         color: Color.fromRGBO(133, 88, 51, 1),
                        text: "complaint",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                        fontfamily: 'OleoScript',
                        underLine: TextDecoration.none,
                      ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (Url.Token_user == "")
                        { Get.back();
                        controller.openDialog(context);
                        controller.isDrawerOpen.value = false;}
                        else{
                          Get.back();
                          controller.isDrawerOpen.value=false;
                          Get.toNamed('/MyFavorite');}
                      },
                      child: Container(
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
                            Icon(Icons.favorite_sharp,color: pink),
                            // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,


                            ),
                            TextUtils(
                              color: Color.fromRGBO(133, 88, 51, 1),
                              text: "my favorite",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,

                              fontfamily: 'OleoScript',
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                      ),
                    ),
                        InkWell(
                          onTap: () async{
                             if (Url.Token_user == "")
             { Get.back();
              controller.openDialog(context);
                controller.isDrawerOpen.value = false;}
                          else{
                            await logoutuser(Url.Token_user );
 Securestorage storage=new Securestorage();
                              await storage.delete('token_user');
                              await storage.delete('id_user');
                              print("token");
                              String token=await storage.read('token_user');

                              print(token);
                              controller5.profile=Profile(id: 0, name: '', email: '', phone: '', image: '').obs;
                                Get.back();
                                Get.offNamed('/signupfirst');
                            controller.isDrawerOpen.value=false;
                         //   Get.offAndToNamed('/welcome');

                          } 
                          },
                          child: Container(
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
                            Icon(Icons.logout,color: pink),
                                // color: isclick_add == true ? kPrimaryColor : white),
                            SizedBox(
                              width: 30,
                            ),
                          TextUtils(
                                                 color: Color.fromRGBO(133, 88, 51, 1),
                                                text: "Logout",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                
                                                fontfamily: 'OleoScript',
                                                underLine: TextDecoration.none,
                                              ),
                          ],
                                                ),
                                              ),
                        ),
                    ])
                         ),
                         ),
            ),
            body: 
            LiquidPullToRefresh(
               onRefresh:_handleRefresh,
              color: Colors.transparent,
              height: 100,
              backgroundColor: Colors.white,
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
              child:
               SingleChildScrollView(
                 child: Container(
                    width: MediaQuery.of(context).size.width,
                          height:  MediaQuery.of(context).size.height,
                          decoration: ShapeDecoration(
                            gradient: backColor,  shape: RoundedRectangleBorder(
                           
                            ),),
                  child:  SingleChildScrollView(
                    child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                          Builder(
                            builder: (context) {
                              return Row(children: [
                               
                                 SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                 IconButton(
                                        onPressed: () async{
                                          controller8.onConnectPressed();
                                          Scaffold.of(context).openDrawer();
                                          Securestorage storage=new Securestorage();
                                          // String? tokenuser =await storage.read('token_user') ;
                                          //  final Storage = new FlutterSecureStorage();
                                          //  await Storage.delete(key: 'token_user');
                                           String? tokenuser =await storage.read('token_user') ;
                                          print(tokenuser);
                                //                         if (controller.zoomcontroller.isOpen==true) {
                                //   controller.zoomcontroller.close!();
                                // } else {
                                //   controller.zoomcontroller.open!();
                                // }
                                        },
                                        //  Get.toNamed('/points'),
                                        icon: Icon(Icons.list),
                                        color: darkbeige,
                                        iconSize: 28,
                                      ), 
                                      Obx(() =>
                                      controller.isSearch_product.value==false &&  controller.isSearch_collection.value==false?
                                      SizedBox(width: MediaQuery.of(context).size.width*0.6,): 
                                       controller.isSearch_product.value==true ?
                                         SizedBox(
                                          height:  MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.7,
                                         child: SearchFormText(
                                          onpressed: () {
                                            controller.isSearch_product.value=false;
                                            controller2.productList.value=[];
                                          },
                                            validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter to Search';
                          }
                          else{ return null;}
                        },
                        onchange: (value ) {
                          print(value);
                           controller2.name=value;
                          //  print(controller2.isclick.value);
                          controller2.fetchSearchProduct();
                         
                          },
                                          text: "Search")):
                                           controller.isSearch_collection.value?
                                           SizedBox(
                                          height:  MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.7,
                                         child: SearchFormText(
                                          onpressed: () {
                                            controller.isSearch_collection.value=false;
                                            controller3.collectionlist.value=[];
                                          },
                                            validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter to Search';
                          }
                          else{ return null;}
                        },
                        onchange: (value ) {
                          print(value);
                           controller3.name=value;
                          //  print(controller2.isclick.value);
                          controller3.fetchSearchCollection();
                         
                          },
                                          text: "Search")): SizedBox(width: MediaQuery.of(context).size.width*0.6,)
                                          
                                          ),
                        //                           
                        //   ),),
                        //  SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                        Obx(() =>   controller.isSearch_product.value==false && controller.isSearch_collection.value==false? IconButton(
                           key: _buttonKey,
                    
                                        onPressed: () {
                                            
                      // print('Selected Indices: ${controller.selectedIndices}');
                    
                      final RenderBox renderBox = _buttonKey.currentContext!
                          .findRenderObject() as RenderBox;
                      final position = renderBox.localToGlobal(Offset.zero);
                               
                      // Print the x and y coordinates
                               
                      final buttonRect = Rect.fromPoints(
                        position,
                        Offset(position.dx + renderBox.size.width,
                            position.dy + renderBox.size.height),
                      );
                               
                      showMenu(
                        context: context,
                        position: RelativeRect.fromRect(
                          buttonRect,
                          Offset.zero & MediaQuery.of(context).size,
                        ),
                        items: [
                          PopupMenuItem(
                            child: Text('product'),
                            value: 'product',
                          ),
                          PopupMenuItem(
                            child: Text('collection'),
                            value: 'collection',
                          ),
                         
                        ],
                      ).then((value)  {
                        if (value == "product") {
                            controller.isSearch_product.value=true;
                              print('Selected Action: product');
                            print(controller.isSearch_product);
                            print(controller.isSearch_collection);
                          // Handle the selected value
                        
                        
                        } else if (value == "collection") {
                          controller.isSearch_collection.value=true;
                            print("product ${controller.isSearch_product.value}");
                            print("collection ${controller.isSearch_collection.value}");
                          print('Selected Action: collection');
                        } 
                       
                      });
                    
                                        //  controller.isSearch_product.value=true;
                                        },
                                        //  Get.toNamed('/points'),
                                        icon: Icon(Icons.search),
                                        color: darkbeige,
                                        iconSize: 28,
                                      ):SizedBox(width: 0,),),
                                       
                                      // SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                        IconButton(
                                        onPressed: () {
                                           if (Url.Token_user == "")
                                   controller.openDialog(context);
                             else 
                                        Get.to(cart ());
                    
                    
                    },
                                        //  Get.toNamed('/points'),
                                        icon: Icon(Icons.shopping_cart),
                                        color: darkbeige,
                                        iconSize: 28,
                                      ),
                              ],);
                            }
                          ),
                          // صورة في الأعلى
                           SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                          //  SizedBox(
                            // height: MediaQuery.of(context).size.height*0.2,
                          //  width:  MediaQuery.of(context).size.width,
                            //  child:
                              CarouselSlider(items:[ 
                                Container(
                                               height: MediaQuery.of(context).size.height*0.1,
                              
                                               width: MediaQuery.of(context).size.width*0.9,
                                               margin: const EdgeInsets.only(left: 10),
                                               decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/flower.png',),
                                fit: BoxFit.cover,
                                 opacity: 0.75 
                              ),
                                               ),
                                             ), 
                                               Container(
                                               height: MediaQuery.of(context).size.height*0.1,
                              
                                               width: MediaQuery.of(context).size.width*0.9,
                                               margin: const EdgeInsets.only(left: 10),
                                               decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/flo2.png',),
                                fit: BoxFit.cover,
                                opacity: 0.75
                              ),
                                               ),
                                             ), 
                                               Container(
                                               height: MediaQuery.of(context).size.height*0.1,
                              
                                               width: MediaQuery.of(context).size.width*0.9,
                                               margin: const EdgeInsets.only(left: 10),
                                               decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/flo3.png',),
                                fit: BoxFit.cover,
                                 opacity: 0.75
                              ),
                                               ),
                                             ), 
                                             
                                             ], 
                                             options: CarouselOptions(
                                              height: MediaQuery.of(context).size.height*0.2,
                                              aspectRatio: 16/8,
                                              viewportFraction: 0.85  ,
                                              autoPlay: true,
                                              autoPlayInterval: Duration(seconds: 3),
                                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.5,
                                              reverse: true
                                             )),
                          //  ),
                          
                          // TabBar أسفل الصورة
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                           Obx(()=> controller.isLoading.value?
                           Text(""):controller.isSearch_product.value || controller.isSearch_collection.value?
                          SizedBox(height: 0,):
                          SizedBox(
                            height: MediaQuery.of(context).size.width*0.1,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 30),
                             child:
                     
                        controller. category.categories.length== 0?
                          Center(child: Text('There are no categories')):
                                ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return  Obx((){
                                        return InkWell(
                                          onTap: () {
                                            controller.current.value=index; 
                                            controller.current_cat.value=controller.maincat[index];
                                            controller.basic_cat.value=controller.current_cat.value;
                                            if(controller.current_cat.value.subCategory.length>0)
                                             controller.sub_cat.value= controller.current_cat.value.subCategory[0];
                                              print("basic");
                                              print( controller.basic_cat.value.name);
                                            print(controller.current.value);
                                          },
                                          child: Container(
                                            // height: 20,
                                             width:  MediaQuery.of(context).size.width*0.3,
                                          alignment: Alignment.center,
                                          //  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white, // لون خلفية التبويب
                                            borderRadius: BorderRadius.circular(100.0),
                                
                                
                                                     border: Border.all(
                                                            color: controller.current.value==index?Colors.green:pink,
                                                            width: 1,
                                                          ), // شكل الحواف
                                          ),
                                          child: Text('${controller.maincat[index].name}',
                                           style: TextStyle(color: Colors.black54,fontFamily: 'OleoScript',)
                                          ), // نص التبويب
                                                                ),
                                        );}
                                      );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: controller.maincat.length,
                                  ),
                              ),
                            ),),
                              //  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                              // Contassssiner(
                              //     alignment: Alignment.center,
                              //     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              //     decoration: BoxDecoration(
                              //       color: Colors.transparent, // لون خلفية التبويب
                              //       // borderRadius: BorderRadius.circular(20.0), // شكل الحواف
                            
                                 Obx(() =>   Stack(children: [     //     ),
                              //     // child: Text('${id}', style: TextStyle(color: Colors.white)), // نص التبويب
                              //   ),
                              Obx(()=>
                                 Container(
                                        height: MediaQuery.of(context).size.height*0.56,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent, // لون خلفية التبويب
                                           // شكل الحواف
                                        ),
                                        child: controller.isLoading.value?
                                                     Center(child: CircularProgressIndicator()):
                                                       controller.isSearch_product.value?
                                                       controller2.productList.isEmpty?
                                                         Center(child: Text("No result ....")):
                                                         Column( 
                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                                             children: [
                                  SizedBox(height: 50,),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.48,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20,right: 20),
                                      child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // عدد الأعمدة
                                         mainAxisExtent: 205,
                                          crossAxisSpacing: 10.0, // المسافة بين الأعمدة
                                          mainAxisSpacing: 10.0, // المسافة بين الصفوف
                                        ),
                                        itemCount: controller2.productList.length,
                                        itemBuilder: (context, index) {
                                          return  Product_search_card(index);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                             ],
                                                           ): controller.isSearch_collection.value?
                                                       controller3.collectionlist.isEmpty?
                                                         Center(child: Text("No result foy your search")):
                                                           ListView(
                                             
                                            children: [
                                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                              for (int i = 0; i <controller3.collectionlist.length ; i++)
                                                collection_search_card(controller3.collectionlist[i] , i)
                                                // Text('${controller.category!.categories[controller.current.value].collections[i].name}', style: TextStyle(color: Colors.red))
                                          ],):
                                                    controller. category.categories.length== 0?
                                                      Center(child: Text('There are no collections in this category')):
                                        ListView(
                                             
                                            children: [
                                              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                              for (int i = 0; i <controller.current_cat.value.collections.length ; i++)
                                                collection(controller.current_cat.value , i)
                                                // Text('${controller.category!.categories[controller.current.value].collections[i].name}', style: TextStyle(color: Colors.red))
                                          ],),),
                              ),
                                        Positioned(top: 0 ,
                      left:  220,
                        child:SizedBox(
                          height: 50,
                          width: 200,
                          child:controller.isSearch_product.value || controller.isSearch_collection.value?
                          Text(""):
                          
                           controller.current_cat.value.subCategory.length>0 ||controller.current_cat.value.mainCategory!=null?DropdownButtonFormField<String>(
                                    value:controller.current_cat.value.mainCategory==null? controller.str_sub(controller.current_cat.value)[0]:controller.str_sub(controller.basic_cat.value)[0],
                                    onChanged: (String? newValue) {
                                      controller.sub.value = newValue!;
                                      print( controller.sub.value);
                                      print("index");
                                      print(controller.current.value);
                                      controller.basic_cat.value=controller.maincat[ controller.current.value];
                                      print("basic");
                                      print( controller.basic_cat.value.name);
                                      print("current");
                                       print( controller.current_cat.value.name);
                                               
                                      controller.sub_cat.value = controller.basic_cat.value.subCategory.firstWhere(
                                      (category) => category.name == controller.sub.value,
                                      
                                      );
                                      // controller.basic_cat.value=controller.current_cat.value;
                                      // print("basic");
                                      // print( controller.basic_cat.value.name);
                                     controller.current_cat.value = controller.sub_cat.value ;
                                      print(controller.sub_cat.value.id);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0), // جعل الحواف مدورة
                                        borderSide: BorderSide(color: Colors.transparent,
                                               
                                                   ), // تغيير لون حواف الحقل
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(color: Colors.transparent,
                                        ), // تغيير لون حواف الحقل عندما يكون غير مفعّل
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(color:Colors.transparent,
                                        ), // تغيير لون حواف الحقل عند التركيز عليه
                                      ),
                                      fillColor: Colors.transparent, // لون الخلفية من الداخل
                                      filled: true,
                                      labelStyle: TextStyle( color: Colors.black26,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,),
                                    ),
                                     
                                     items:controller.current_cat.value.mainCategory==null?controller.str_sub(controller.current_cat.value)
                            .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(value,
                                          maxLines: 1,
                                            style: TextStyle(
                                            
                                            fontSize: 15,
                                            color: pink,
                                            fontFamily: 'OleoScript',),
                                          ),
                                        ),
                                      );
                                    }).toList():controller.str_sub(controller.basic_cat.value) .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,  style: TextStyle(
                                           fontSize: 15,
                                          color: pink,
                                          fontFamily: 'OleoScript',),
                                        ),
                                      );
                                    }).toList()
                                  ):Text("")
                        ),)
                                        ],
                                   
                                      
                                      //  Center(child: Text('${controller.category!.categories[controller.current.value].name}', style: TextStyle(color: Colors.red))), // نص التبويب
                                                                 ),),
                                   
                                
                            
                        
                      
                      
                      ]
                    
                    ),
                  ),
                          
                       
                               ),
               ),),
            // ),
             floatingActionButton: FloatingActionButton(
              backgroundColor: pink,
        onPressed: ()async { 
          openDialog(context);
         },
        // tooltip: 'Increment',
        child: const Icon(Icons.add ,color: white,),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
        
      ),
          );
  }
void openDialog(BuildContext context) {
    controller1.isDialogbouket.value = true;
    Get.dialog(AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 30),
        
        content: Container(
          height: 250,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 5,
                  // ),
                  IconButton(
                      onPressed: () {
                        //  print("Email is ${controller1.profile!.user.email}");

                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black87,
                        size: 26,
                      )),
                ],
              ),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  fontfamily: 'OleoScript',
                  text: " Design your bouquet with colors and shapes that match your taste :",
                  color: Colors.black54,
                  underLine: TextDecoration.none),
 
              SizedBox(
                height: 30,
              ),
              Button(
                onPressed: () async {
                   
                  //controller.addprod2();
                  
                   if (Url.Token_user == "")
             { Navigator.of(context).pop();
              controller.openDialog(context);
                controller1.isDialogbouket.value = false;}
          else {
          print(Url.Token_user);
          if(controller1.colors.length==0 || controller1.box.boxes.length==0 ||controller1.flowers.products.length==0 ||controller1.addition.additions.length==0)
          {print("orderrr");
            await EasyLoading.show(status: "loading");
           await controller1.order();
           EasyLoading.showSuccess("");
           //  await controller1.GetFlowers();
           // await controller1.GetColors();
           // await controller1.GetBoxes();
          }
          print("nooooooo orderrr");
          Navigator.of(context).pop();
          Get.toNamed('/order');
          
                     controller1.isDialogbouket.value = false;}
                },
                color: pink,
                text: "  Create Bouqet",
                hight: 40,
                width: 80,
              ),
               SizedBox(
                height: 10,
              ),
       
            ],
          ),
        )));
  }
  
   Future<void> logoutuser(String token )async {

    var url=Uri.parse(Url.domain+Url.logoutuser);
    print(url);
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
         'Authorization': 'Bearer ${Url.Token_user}',
      },


    );
    print(response.body);
    print(response.statusCode);

  }

  Future<void>_handleRefresh() async{
    print("homebage.................");
    controller.isLoading.value=true;
     
  await controller.GetCategories();
 
  return await Future.delayed(const Duration(seconds:1));
}
  }




