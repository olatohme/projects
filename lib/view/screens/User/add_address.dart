import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../consts/colors.dart';
import '../../../consts/url.dart';
import '../../../controller/add_address_controller.dart';
import '../../widget/button_gradient.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/text.dart';
// ignore: must_be_immutable
class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);
  var controller = Get.find<AddAddressController>();
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: fromKey,
      child: SafeArea(child: Scaffold(
          body:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: backColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Center(
                      child: TextUtils(fontSize:30,
                        fontWeight: FontWeight.bold,
                        text: 'Add New Address',
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextUtils(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        text: 'Address Line 1',
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an Address Line 1';
                        }
                        else{ return null;}
                      },
                      onchange: (value1 ) { controller.line_one=value1;  },
                      hight: 7,
                      width: 350,
                      hintText: 'Adresss',
                      obscureText:false,
                      prefixIcon:  Text(""),
                      suffixIcon:  Text(""),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextUtils(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        text: 'Address Line 2',
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ),
                    CustomTextField(
                      validator: (value ) {
                        if (value.isEmpty) {
                          return 'Please enter an Address Line 2';
                        }
                        else{ return null;} },
                      onchange: (value2 ) {     controller.line_two=value2;},
                      hight: 7,
                      width: 350,
                      hintText: 'Adresss',
                      obscureText:false,
                      prefixIcon:  Text(""),
                      suffixIcon:  Text(""),
                    ),

                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          "Country",
                          style: TextStyle(
                            fontFamily: 'OleoScript',
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                            color: Colors.brown,
                            fontSize: 15,
                          ),
                        ),
                      ),
                        Obx(() => SizedBox(
                          height:MediaQuery.of(context).size.height * 0.07,
                          width:350,
                          //MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField<String>(
                            value: controller.country_name.value,
                            onChanged: (String? newValue) {
                              controller.country_name.value = newValue!;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0), // جعل الحواف مدورة
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),), // تغيير لون حواف الحقل
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),), // تغيير لون حواف الحقل عندما يكون غير مفعّل
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),), // تغيير لون حواف الحقل عند التركيز عليه
                              ),
                              fillColor: Colors.white, // لون الخلفية من الداخل
                              filled: true,
                              labelStyle: TextStyle( color: Colors.black26,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            items: <String>['Syria',
                            ]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,  style: TextStyle(color: Colors.black38,
                                  fontFamily: 'OleoScript',),),
                              );
                            }).toList(),
                          ),
                        )
                        )
                      ],),
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          "Cities",
                          style: TextStyle(
                            fontFamily: 'OleoScript',
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                            color: Colors.brown,

                            fontSize: 16,
                          ),
                        ),
                      ),
                        Obx(() => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width:350,
                          //MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField<String>(
                            value: controller.city.value,
                            onChanged: (String? newValue) {
                              controller.city.value = newValue!;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0), // جعل الحواف مدورة
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),
                                ), // تغيير لون حواف الحقل
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),
                                ), // تغيير لون حواف الحقل عندما يكون غير مفعّل
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0xEFFFF1E1),
                                ), // تغيير لون حواف الحقل عند التركيز عليه
                              ),
                              fillColor: Colors.white, // لون الخلفية من الداخل
                              filled: true,
                              labelStyle: TextStyle( color: Colors.black26,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,),
                            ),

                            items: <String>['Damascus',
                              'Rif Dimashq',
                              'Aleppo',
                              'Homs',
                              'Hama',
                              'Latakia',
                              'Raqqa',
                              'Deir ez-Zor',
                              'Tartus',
                              'Idlib',
                              'Al-Hasakah',
                              'Daraa',
                              'As-Suwayda',
                              'Salamiyah',
                              'Al-Qamishli',
                            ]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,  style: TextStyle(color: Colors.black38,
                                  fontFamily: 'OleoScript',),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextUtils(fontSize: 15,
                        fontWeight: FontWeight.bold,
                        text: 'Street',
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ),
                    CustomTextField(
                      validator: ( value) {
                        if (value.isEmpty) {
                          return 'Please enter a Street';
                        }
                        else{ return null;}
                      },
                      onchange:(values){
                        controller.street=values;
                        },
                      hight: 10,
                      width: 350,
                      hintText: 'Street',
                      obscureText:false,
                      prefixIcon:  Text(""),
                      suffixIcon:  Text(""),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left:35),
                      child: Basic_Button(text: 'Add New Address',
                        width:  MediaQuery.of(context).size.width *0.7 ,
                        hight:44,
                        onPressed: ()async{
                          controller.user_id='${Url.id_user}';
                          controller.country_id='1';
                          if (fromKey.currentState!.validate()) {
                           await EasyLoading.show(status: 'loading');
                            await controller.add_address(
                            );

                            // Get.offNamed('/');
                          }
                          Get.back();

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
      ),
    );
  }
}
