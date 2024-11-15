import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';

import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../consts/url.dart';





// ignore: must_be_immutable
class bouqet_card extends StatelessWidget {
  int index1;
  bouqet_card (this.index1);
  var controller = Get.find<OrderController>();
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
Url.idBouqet=controller.bouqets.bouquets[index1].id;
            
openDialog(context);
        //  Url.id_provider =controller1.prov.providers[index].id;
        //  Get.toNamed('/profileProvider');
        },
      child:
       Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
    Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Text(
                        "${controller.bouqets.bouquets[index1].name}",
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          color: pink,
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 40),
                       child: Text(
                        "TotalPrice :${controller.bouqets.bouquets[index1].totalPrice} \$",
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          color: darkbeige,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                                           ),
                     ),
                    const SizedBox(
                      height: 15,
                    ),
       Padding(
         padding: const EdgeInsets.only(left: 40),
         child: Text(
                        "This bouquet contains :\n${controller.bouqets.bouquets[index1].products.length} types of flowers and ${controller.bouqets.bouquets[index1].additions.length} types of addition ",
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
       ),
                    const SizedBox(
                      height: 15,
                    ),
        ],)
       ));        
  }

      void openDialog(BuildContext context) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      SizedBox(
        // width: 1000,
        child: AlertDialog(
          backgroundColor: Colors.white ,
           insetPadding: EdgeInsets.symmetric(vertical: 120,horizontal:0 ),
         
          
          content: SizedBox(
          width: double.infinity, // جعل عرض الـ dialog يمتد على عرض الشاشة
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start ,
            children: [  
            Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
                        "${controller.bouqets.bouquets[index1].name}",
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          color: pink,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: Text(
                        "TotalPrice :${controller.bouqets.bouquets[index1].totalPrice} \$",
                        style: TextStyle(
                            fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          color: darkbeige,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                                           ),
                     ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                       padding: const EdgeInsets.only(left: 20 ,right: 40),
                       child: Row(
                         children: [
                           Container(
                            width:MediaQuery.of(context).size.width *0.2  ,
                            height: MediaQuery.of(context).size.height *0.1,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // لون خلفية التبويب
                            borderRadius: BorderRadius.circular(10.0),
                            image: controller.bouqets.bouquets[index1].design.image == null? DecorationImage(
                      image:
                          AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover):
                     DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${controller.bouqets.bouquets[index1].design.image}'),
                      //     AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover,
                    
                          // شكل الحواف
                          ),)
                          ),
                          const SizedBox(
                      width: 20,
                    ),
                           Text(
                            "${controller.bouqets.bouquets[index1].design.name} ",
                            style: TextStyle(
                                fontFamily: 'OleoScript',
                              overflow: TextOverflow.ellipsis,
                              color: darkbeige,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                                               ),
                                                const SizedBox(
                      width: 20,
                    ),
                           Text(
                            "Color is ",
                            style: TextStyle(
                                fontFamily: 'OleoScript',
                              overflow: TextOverflow.ellipsis,
                              color: darkbeige,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                                               ),
                                                 const SizedBox(
                      width: 20,
                    ),
                   
                    Container(
                                        height: 30,
                                        width: 30,
                                        margin: const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          color:  Color.fromRGBO(controller.getcolor(index1)[0],controller.getcolor(index1)[1],controller.getcolor(index1)[2], 0.7),
                                          // ${controller.colors.color[index].rgbCode},
                                          borderRadius: BorderRadius.circular(100),
                                            border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ), 
                                        ),
                                      ),
                     const SizedBox(
                      height: 15,
                    ),
                  
                         ],
                       ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20 ,left: 20),
                          child: Text(
                              "Types of roses :",
                              style: TextStyle(
                                  fontFamily: 'OleoScript',
                                overflow: TextOverflow.ellipsis,
                                color: darkbeige,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                                                 ),
                        ),
                        SizedBox(height: 10,),
  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width *0.7 ,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                             
            
                              return  
                             Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: 
                                        // controller.current.value == size
                                        //     ? Colors.brown.withAlpha(80)
                                        //     :
                                             Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:  Colors.black26,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: TextUtils(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            text: '${ controller.bouqets.bouquets[index1].products[index].productName}',
                                            color: Colors.black26,
                                            underLine: TextDecoration.none,
                                            fontfamily: 'OleoScript',
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 9,
                            ),
                            itemCount:controller.bouqets.bouquets[index1].products.length
                          ),
                      ),
                    ),
                     SizedBox(height: 25,),
  
 Padding(
   padding: const EdgeInsets.only(left: 20),
   child: Text(
                              "ِAdditions with bouqet :",
                              style: TextStyle(
                                  fontFamily: 'OleoScript',
                                overflow: TextOverflow.ellipsis,
                                color: darkbeige,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                                                 ),
 ),
 SizedBox(height: 10,),
  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width *0.8 ,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                             
            
                              return  
                             Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: 
                                        // controller.current.value == size
                                        //     ? Colors.brown.withAlpha(80)
                                        //     :
                                             Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:  Colors.black26,
                                          width: 1.5,
                                        ),
                                      ),
                                      child:Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: TextUtils(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        text: '${ controller.bouqets.bouquets[index1].additions[index].name}',
                                        color: Colors.black26,
                                        underLine: TextDecoration.none,
                                        fontfamily: 'OleoScript',
                                      ),
                                    ),))
                                  );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 9,
                            ),
                            itemCount: controller.bouqets.bouquets[index1].additions.length
                          ),
                      ),
                    ),



                       Padding(
                         padding: const EdgeInsets.only(left: 100 ,top: 30),
                         child: Button(
                                             onPressed: () async{
                                              
                                             await controller.Add_bouqetToCart();
                                              Navigator.of(context).pop();
                     controller.isDialogOpen.value = false;

                                            
                          },
                                               
                                             text: "Add To Cart",
                                             hight: 40,
                                             width: 60,
                                             color: pink,
                                           ),
                       ),
       ] ),),
      ),
    
  
      ),
    );
  }
}
