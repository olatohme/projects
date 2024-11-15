import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';
import 'package:new_proj/view/widget/product_search_card.dart';
import 'package:new_proj/view/widget/text.dart';
import '../../../../consts/colors.dart';
import '../../../../controller/search_product_controller.dart';

// ignore: must_be_immutable
class SearchProductView extends StatelessWidget {
  SearchProductView({Key? key}) : super(key: key);
  var controller = Get.find<SearchProductController>();
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
                       controller.name=value;
                       print(controller.isclick.value);
                      controller.fetchSearchProduct();
                      // if(controller.isclick.value==true){
                      //   controller.isclick.value==false;
                      // }
                      // if(controller.isclick.value==false){
                      //   controller.isclick.value==true;
                      // }
                      // print(controller.isclick.value);
                      },
                    hight: 7,
                    width: 350,
                    hintText: 'search for a product',
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
                  } else if (controller.productList.isEmpty) {
                    return Center(
                      child: TextUtils(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        text: "No Product Found",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    );
                  } else {

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: backColor,
                    ),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50,),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.88,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // عدد الأعمدة
                                     mainAxisExtent: 205,
                                      crossAxisSpacing: 10.0, // المسافة بين الأعمدة
                                      mainAxisSpacing: 10.0, // المسافة بين الصفوف
                                    ),
                                    itemCount: controller.productList.length,
                                    itemBuilder: (context, index) {
                                      return  Product_search_card(index);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            ],
                          ),
                        ),

                  );}
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
