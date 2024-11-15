import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/view/widget/card_search_provider.dart';
import '../../../consts/colors.dart';
import '../../../controller/search_provider_controller.dart';

import '../../widget/custom_textfield.dart';
import '../../widget/text.dart';
// ignore: must_be_immutable
class SearchProviderView extends StatelessWidget {
  SearchProviderView({Key? key}) : super(key: key);
  var controller = Get.find<SearchProviderController>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: backColor,
          ),
          child:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TextUtils(fontSize:30,
                      fontWeight: FontWeight.bold,
                      text: 'enter search',
                      color: Colors.brown,
                      underLine: TextDecoration.none,
                      fontfamily: 'OleoScript',
                    ),
                  ),
                  SizedBox(height: 100,),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      text: 'search 1',
                      color: Colors.brown,
                      underLine: TextDecoration.none,
                      fontfamily: 'OleoScript',
                    ),
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter to Search';
                      }
                      else{ return null;}
                    },
                    onchange: (value ) {
                      print(value);
                     // controller.prov.providers=[];
                      controller.name=value;
                      print(controller.isclick.value);
                      //controller.fetchSearchProvider1();
                      controller.fetchProviders();
                      // if(controller.isclick.value==true){
                      //   controller.isclick.value==false;
                      // }
                      // if(controller.isclick.value==false){
                      //   controller.isclick.value==true;
                      // }
                      // print(controller.isclick.value);
                   //   controller.prov.providers=[];
                    },
                    hight: 7,
                    width: 350,
                    hintText: 'search for a provider',
                    obscureText:false,
                    prefixIcon:  Text(""),
                    suffixIcon:  Text(""),
                  ),

                  SizedBox(height: 10,),
                  Obx((){
                    if(controller.isclick==false){
                      return Container();
                    }
                    else{
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (controller.providers.isEmpty) {
                        return Center(
                          child: TextUtils(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            text: "No Provider Found",
                            color: Colors.black,
                            underLine: TextDecoration.none,
                            fontfamily: 'OleoScript',
                          ),
                        );
                      } else {
                        return   SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height,
                            decoration: ShapeDecoration(
                              gradient: backColor,  shape: RoundedRectangleBorder(

                            ),),
                            child: Container(
                                  //  height: MediaQuery.of(context).size.height * 0.95,
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return search_provider_card(index);
                                        },
                                        separatorBuilder: (context, index) => const SizedBox(
                                          height: 15,
                                        ),
                                        itemCount:controller.providers.length
                                    ),
                                  ),



                          ),
                        );

                      }
                    }

                  }),

                ],
              ),
            ),
          ),
        )
    ),
    );
  }
}
