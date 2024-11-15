import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/cart_controller.dart';
import 'package:new_proj/models/create_order_model.dart';
import 'package:new_proj/serves/cart_serves.dart';
import 'package:new_proj/view/widget/button_gradient.dart';
import 'package:new_proj/view/widget/text.dart';
import 'package:http/http.dart'as http;

class cart2 extends StatelessWidget {

   cartserves serves = cartserves();
  int number=0;
  var id=0;
  var iditem=0;
   var idbouquet=0;
   var check='items';

  CartController controller =  Get.put<CartController>(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//backgroundColor: Color(0xFFFFF1E1).withOpacity(0.99999999999),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [ Color(0xFFFFF1E1),Color(0xFFF5F5F5)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: DefaultTabController(
          length: 2, // عدد التبويبات في كل TabBar
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.chevron_left),
                        color: Colors.brown,
                        iconSize: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1), TextUtils(text: 'Shopping Cart',color: darkbeige,fontSize: 33,
                    fontWeight: FontWeight.w500,underLine:  TextDecoration.none,
                    fontfamily: 'OleoScript',),])
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height*0.04, ),
              // TabBar الأول
              TabBar(
                tabs: [
                  Tab(text: 'My Products'),
                  Tab(text: 'My Boukets'),
                ],
                indicatorColor: pink,
                labelColor: pink,
                unselectedLabelColor: Colors.grey,
              ),
              
              // TabBar الثاني
              

              // محتوى الـ TabBarView
              
                        Expanded(
                          child: TabBarView(
                            children: [
                                       Container(
                       height: MediaQuery
                    .of(context)
                    .size
                    .height*0.55,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                        child:
                        Obx(() {
                          if (controller.isloading.isTrue) {
                            return
                              const Center(
                                child: CircularProgressIndicator(
                                  color: darkbeige,
                                  strokeWidth: 6,
                                ),
                              );
                          }
                          else
                            return
                              SizedBox(
                                 height: MediaQuery.of(context).size.height*0.75,
                                
                                child: ListView.builder(
                                    itemCount: controller.cartlist.customBouquets
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            idbouquet = controller.cartlist
                                                .customBouquets[index].id;
                                            print(idbouquet);
                                          },
                                          child: Container(
                                            height: 130,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0.0, 4),
                                                      blurRadius: 10)
                                                ]),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 10,
                                                  left: 10
                                                  ,
                                                  bottom: 10,
                                
                                                  child: Container(
                                                    height: 160,
                                                    width: 110,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .only(
                                                        topLeft: Radius.circular(
                                                            10),
                                                        bottomLeft: Radius
                                                            .circular(10),
                                                        bottomRight: Radius
                                                            .circular(10),
                                                        topRight: Radius.circular(
                                                            10),
                                                      ),
                                                      image: controller.cartlist.customBouquets[index].design.image==null? DecorationImage(
                                                      image:
                                                          AssetImage('assets/images/default.png',),
                                                      fit: BoxFit.cover):
                                                     DecorationImage(
                                                        image: NetworkImage('${Url.domain}' +
                                                        '${controller.cartlist.customBouquets[index].design.image}',),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 7,
                                                  left: 127,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width:140,
                                                            child: TextUtils(
                                                              text: "${controller
                                                                  .cartlist
                                                                  .customBouquets[index]
                                                                  .name}"
                                                              ,
                                                              color: Colors.black,
                                                              fontSize: 13,
                                                              fontWeight: FontWeight
                                                                  .w100,
                                                              underLine: TextDecoration
                                                                  .none,
                                                              fontfamily: 'OleoScript',),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width * 0.17,),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            //   color: Colors.red,
                                                            decoration: ShapeDecoration(
                                
                                                              color: Colors.red,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(80),
                                                              ),
                                                            ),
                                                            child: IconButton(
                                                                onPressed: ()async  {
                                                                  idbouquet =
                                                                      controller
                                                                          .cartlist
                                                                          .customBouquets[index]
                                                                          .id;
                                                                  print(
                                                                      idbouquet);
                                                                      controller.isloading(!controller.isloading.value);
                                                                      deletbouquet();
                                                                      
                                                                    
                                                          //  await serves.getcart(Url.Token_user);
                                                          
                                                                },
                                                                icon: Icon(Icons
                                                                    .delete,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 16,)),
                                                          ),
                                                        ],
                                                      ),
                                
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(0.0),
                                                        child: TextUtils(
                                                          text: "quantity : " +
                                                              "${controller
                                                                  .cartlist
                                                                  .customBouquets[index]
                                                                  .products[0]
                                                                  .quantity}"
                                                          ,
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w100,
                                                          underLine: TextDecoration
                                                              .none,
                                                          fontfamily: 'OleoScript',),
                                                      ),
                                
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(
                                                            right: 200, top: 6),
                                                        child: TextUtils(
                                                          text: "total price : " +
                                                              "${controller
                                                                  .cartlist
                                                                  .customBouquets[index]
                                                                  .totalPrice}"
                                                          ,
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w100,
                                                          underLine: TextDecoration
                                                              .none,
                                                          fontfamily: 'OleoScript',),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(
                                                            right: 260, top: 5),
                                                        child: TextUtils(
                                                          text: "color : " +
                                                              "${controller
                                                                  .cartlist
                                                                  .customBouquets[index]
                                                                  .color.name}"
                                                          ,
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w100,
                                                          underLine: TextDecoration
                                                              .none,
                                                          fontfamily: 'OleoScript',),
                                                      ),
                                                         
                                                    ],
                                                  ),
                                                ),
                                
                                              ],
                                            ),
                                          ),
                                        ),
                                
                                
                                      );
                                    }),
                              );
                        }),
                      ),
                  
                                Container(
                       height: MediaQuery
                    .of(context)
                    .size
                    .height*0.55,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                        child:
                        Obx(() {
                          if (controller.isloading.isTrue) {
                            return
                              const Center(
                                child: CircularProgressIndicator(
                                  color: darkbeige,
                                  strokeWidth: 6,
                                ),
                              );
                          }
                          else
                            return
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.75,
                                child:  ListView.builder(
                            itemCount: controller.cartlist.items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    iditem = controller.cartlist.items[index]
                                        .productId;
                                  },
                                  child: Container(
                                    height: 120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0.0, 4),
                                              blurRadius: 10)
                                        ]),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          left: 10
                                          ,
                                          bottom: 10,

                                          child: Container(
                                            height: 160,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(
                                                    10),
                                                topRight: Radius.circular(10),
                                              ),
                                          
                                              image: controller.cartlist.items[index].image==null? DecorationImage(
                      image:
                          AssetImage('assets/images/default.png',),
                      fit: BoxFit.cover):
                     DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${controller.cartlist.items[index].image}',),
                      //     AssetImage('assets/images/bouqet.png',),
                      // fit: BoxFit.cover,
                    fit: BoxFit.cover,
                                                ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 7,
                                          left: 127,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width:150,
                                                    child: TextUtils(
                                                      text: "${controller.cartlist
                                                          .items[index]
                                                          .productName}",
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w100,
                                                      underLine: TextDecoration
                                                          .none,
                                                      fontfamily: 'OleoScript',),
                                                  ),
                                                  SizedBox(width:60),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    //   color: Colors.red,
                                                    decoration: ShapeDecoration(

                                                      color: Colors.red,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(
                                                            80),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          iditem =
                                                              controller
                                                                  .cartlist
                                                                  .items[index]
                                                                  .id;
                                                          print(iditem);
                                                          deletproduct();
                                                          //  controller.isloading.value=true;
                                                      //   await serves.getcart(Url.Token_user);
                                                           controller.isloading(!controller.isloading.value);
                                                            
                                                        
                                                        },
                                                        icon: Icon(Icons.delete,
                                                          color: Colors
                                                              .white,
                                                          size: 16,)),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    0.0),
                                                child: TextUtils(
                                                  text: "quantity : " +
                                                      "${controller.cartlist
                                                          .items[index]
                                                          .quantity}",
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  underLine: TextDecoration
                                                      .none,
                                                  fontfamily: 'OleoScript',),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6.0),
                                                child: TextUtils(
                                                  text: "${controller.cartlist
                                                      .items[index]
                                                      .size}"
                                                  ,
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w100,
                                                  underLine: TextDecoration
                                                      .none,
                                                  fontfamily: 'OleoScript',),
                                              ),


                                              //  }),
                                              //       ),


                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),


                              );
                            })
                              );
                        }),
                      ),
                            ],
                          ),
                              
                        ),
                        // SizedBox(height: 30,),
                Basic_Button(
                  hight: 40,
                  text: 'Continue',
                  width: 270,
                  onPressed: () {

                    Get.to(create_order());
                  },


                ),
                    
            ],
          ),
        ),
      )),
     ) );
  }
   Future<bool> deletproduct(  ) async{
    var url=Uri.parse(Url.domain+'/customer/cart/item/'+ '$iditem');
print(url);
// var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTlmNmEwODMwYTY0Mzk5ODQyNDIzOGVjNzQzYmZkNjgzNzEwYzViZTAyMGE5ODJhNDkyYzdmYjZkZTZkM2I0MzU1NmFhNWY4NThmOWI1NTEiLCJpYXQiOjE3MTkwNzQyMDguNjg1NzM2LCJuYmYiOjE3MTkwNzQyMDguNjg1NzQ0LCJleHAiOjE3NTA2MTAyMDguNDM3OTU2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.VcotfxBKbzNPwv2S1K4wNXgV0SQZuP32qr_6ChdO6sXeJk71cQTRL4mJ5TD5alCrsujqBNJ0e7_klEqV1s5akN7km7AUis7DVcuk0npMYqwUJhqMSf6jDiLYh1z9WdTOPVAZgG64leAzkRvQpdZY-ei83xQXYEiItDvr95W4FTzPzhn2-cRIpFH1RpKB1ZYxz60kDg1bgRezb8D8DmgoUtjB5DC4WivlsamZds_9mPRJO5OO774loAylFEfLbksZPlDB6BZ-2pj5n4jW0W7WyN2uXtUpD1u4iBhMDY42ltZSoP-bvyzcZ4O-KU9-dy_XxLqJTuMYS_6VQQ3fkR40LEYJJCdPgCcLkcHMwhhHKG9zAv_7o4DuXL9hq712aauFwGJ3BpqJdjE08ToxEVEKd9AW1nIpbjaSTE_l5qvRzZ1tsizhkWt3le--I9n0Rhyo5nZLDKZT-B1_QFhhBDvo-mdUN-JeuIPg893H7eijOT2RD_BcMqKzY-YY7BcbFxYk1XGiUwu5NgLo5UR2joX6Or6oAO63VAID7jsLfsUzmGwxuzbrol0xjyGLS9rpiGtcjM1Xwqg1WkGRKlikWOvQIPnM7GlDfUfPgdaaFKkiQsd_PIq725M-NeWzTfC9O7GVZeZy3gBc8VXQL9-yq_lNjp8OAu9opusdPUcZ3Z0of5w";

    var response = await http.delete(url , headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Url.Token_user}',

    });

    if (response.statusCode == 200) {
    
      print(response.body);
      controller.cartlist=await serves.getcart(Url.Token_user);
        controller.isloading(!controller.isloading.value);
      return true;

    }
    else
      print(response.body);
    return false;


  }

  Future<bool> deletbouquet(  ) async{
    var url=Uri.parse(Url.domain+'/customer/cart/bouquet/'+ '$idbouquet');
    print(url);
    // var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTlmNmEwODMwYTY0Mzk5ODQyNDIzOGVjNzQzYmZkNjgzNzEwYzViZTAyMGE5ODJhNDkyYzdmYjZkZTZkM2I0MzU1NmFhNWY4NThmOWI1NTEiLCJpYXQiOjE3MTkwNzQyMDguNjg1NzM2LCJuYmYiOjE3MTkwNzQyMDguNjg1NzQ0LCJleHAiOjE3NTA2MTAyMDguNDM3OTU2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.VcotfxBKbzNPwv2S1K4wNXgV0SQZuP32qr_6ChdO6sXeJk71cQTRL4mJ5TD5alCrsujqBNJ0e7_klEqV1s5akN7km7AUis7DVcuk0npMYqwUJhqMSf6jDiLYh1z9WdTOPVAZgG64leAzkRvQpdZY-ei83xQXYEiItDvr95W4FTzPzhn2-cRIpFH1RpKB1ZYxz60kDg1bgRezb8D8DmgoUtjB5DC4WivlsamZds_9mPRJO5OO774loAylFEfLbksZPlDB6BZ-2pj5n4jW0W7WyN2uXtUpD1u4iBhMDY42ltZSoP-bvyzcZ4O-KU9-dy_XxLqJTuMYS_6VQQ3fkR40LEYJJCdPgCcLkcHMwhhHKG9zAv_7o4DuXL9hq712aauFwGJ3BpqJdjE08ToxEVEKd9AW1nIpbjaSTE_l5qvRzZ1tsizhkWt3le--I9n0Rhyo5nZLDKZT-B1_QFhhBDvo-mdUN-JeuIPg893H7eijOT2RD_BcMqKzY-YY7BcbFxYk1XGiUwu5NgLo5UR2joX6Or6oAO63VAID7jsLfsUzmGwxuzbrol0xjyGLS9rpiGtcjM1Xwqg1WkGRKlikWOvQIPnM7GlDfUfPgdaaFKkiQsd_PIq725M-NeWzTfC9O7GVZeZy3gBc8VXQL9-yq_lNjp8OAu9opusdPUcZ3Z0of5w";

    var response = await http.delete(url , headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Url.Token_user}',

    });

    if (response.statusCode == 200) {
       
       controller.cartlist=await serves.getcart(Url.Token_user);
        controller.isloading(!controller.isloading.value);
      print(response.body);
      print( controller.isloading.value);
     
      return true;

    }
    else
      print(response.body);
    return false;


  }

}
