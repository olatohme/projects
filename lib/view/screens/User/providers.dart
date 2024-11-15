

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/providers_controller.dart';
import 'package:new_proj/controller/search_provider_controller.dart';

import 'package:new_proj/view/widget/card_provider.dart';
import 'package:new_proj/view/widget/card_search_provider.dart';

import 'package:new_proj/view/widget/searchformtext.dart';


// ignore: must_be_immutable
class Providers extends StatelessWidget {
  var controller = Get.find<ProvidersController>();
  var controller1 = Get.find<SearchProviderController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
          SingleChildScrollView(
            child:
               Container(
                   width: MediaQuery.of(context).size.width,
                        height:  MediaQuery.of(context).size.height,
                        decoration: ShapeDecoration(
                          gradient: backColor,  shape: RoundedRectangleBorder(
                         
                          ),),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(children: [
                        IconButton(
                          onPressed: () {
                           Get.back();
                          },
                          //  Get.toNamed('/points'),
                          icon: Icon(Icons.chevron_left),
                          color: darkbeige,
                          iconSize: 25,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.27,),
                        Text(
                            " Providers",
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.normal,
                               fontFamily: 'Kings',
                              color: darkbeige,
                              fontSize: 30,
                            ),
                          ),
                
                    ],),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                     SearchFormText(
                      ontap: () {
                        controller1.isclick.value=true;
                      },
                      onpressed: () {
                        controller1.isclick.value=false;
                                      },
                      text: "Search",
                       validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter to Search';
                      }
                      else{ return null;}
                    },
                    onchange: (value ) {
                      print(value);
                      controller1.name=value;
                      print(controller1.isclick.value);
                      //controller.fetchSearchProvider1();
                      controller1.fetchProviders();
                      },
                     
                     
                     ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                   Obx(()=>  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child:
                      //  Obx(() {
                      //   if (controller1.isloading.isTrue) {
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   }
                      //   return 
                          controller.isLoading.value?
                       Center(child: CircularProgressIndicator()):
                       controller1.isclick.value?
                    
                     controller1.providers.isEmpty?
                                                     Center(child: Text("No result ....")):
                                                      ListView.separated(
                        itemBuilder: (context, index) {
                          return search_provider_card(index);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount:controller1.providers.length
                      ):controller.prov.providers.length==0?
                      Center(child: Text('There are no providers ')):
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return  provider_card(index);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount:controller.prov.providers.length
                      ),),)
                    
                 
                        ]),
              ),
            ),
          ),
      
    );
  }
}
