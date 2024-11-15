import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/controller/add_report_controller.dart';
import '../../../consts/colors.dart';
import '../../widget/button_gradient.dart';

import '../../widget/text.dart';
import '../../widget/textfield.dart';

// ignore: must_be_immutable
class AddReport extends StatelessWidget {
   AddReport({Key? key}) : super(key: key);
  var controller = Get.find<AddReportControoler>();
   final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: fromKey,
      child: SafeArea(
        child: Scaffold(
          body:SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: backColor,
              ),
              child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.navigate_before),
                            iconSize: 25,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                      TextUtils(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        text: 'Add your Report',
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                      SizedBox(height: 200,),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: TextField_desc(
                                hintText: ' enter your report',

                                obscureText: false,
                                validator: ( value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your report';
                                  }
                                  else{ return null;}
                                },
                                hight: MediaQuery.of(context).size.height *0.07 ,
                                width: MediaQuery.of(context).size.width * 0.8,
                                keyboardType: TextInputType.emailAddress,
                                onchange: (value) {
                                  controller.report= value;
                                },
                              ),
                            ),
                             SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Basic_Button(text: 'Send ',
                                width:  MediaQuery.of(context).size.width-200 ,
                                hight:44,
                                onPressed: ()async{
                          if (fromKey.currentState!.validate()) {
                             await controller.add_report();
                             Get.back();
                                }
                          },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

            ),
          ),
        ),
      ),
    );
  }
}
