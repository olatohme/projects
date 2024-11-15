import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/order_controller.dart';

import '../../consts/url.dart';

// ignore: must_be_immutable
class card_box extends StatelessWidget {
  int index;
  card_box(this.index);
  var controller1 = Get.find<OrderController>();
  // List<String> images=["box1" , "box2" , "box3" , "box4"];
  //  List<String> names=["Box 1" , "Box 2" , "Box 3" , "Box 4" ,];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(7.0),
      child:
       Obx(()=>
      InkWell(onTap: () {
         controller1.current_b.value=index; 
         controller1.box_id=controller1.box.boxes[index].id;
         controller1.choose_box=true;
      },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Column(
              children: [
                Container(
                height: 130,
                width: 100,
                // margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                   
                                    
                  // border: Border.all(
                  //               color: controller1.current_b.value==index?Colors.black38:pink,
                  //               width: 1,
                  //             ), // شكل الحواف
                  
                  image:  DecorationImage(
                        image: NetworkImage('${Url.domain}' +
                        '${controller1.box.boxes[index].image}'),
                      //     AssetImage('assets/images/bouqet.png',),
                      fit: BoxFit.cover,
                    
                          // شكل الحواف
                          ),
                ),
              ),
                Text(
                "${controller1.box.boxes[index].name}"  ,
                  style: TextStyle(  fontFamily: 'OleoScript',fontSize: 18.0, color: controller1.current_b.value==index?pink:Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}