
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/profile_provider_controlller.dart';
import 'package:new_proj/controller/tasks_controller.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/view/widget/task_card.dart';
import 'package:new_proj/view/widget/text.dart';

//
// ignore: must_be_immutable
class Tasks extends StatelessWidget {
  var controller = Get.find<TasksController>();
  var controller1 = Get.find<ProfileProviderController>();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
          body:
         
         
              
                LiquidPullToRefresh(
                  onRefresh:_handleRefresh,
              color: Colors.transparent,
              height: 100,
              backgroundColor: Colors.white,
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
                child:  SingleChildScrollView(
                  child: Container(
                       width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height,
                            // color: Colors.white,
                            decoration: ShapeDecoration(
                              gradient: backColor,  shape: RoundedRectangleBorder(
                             
                              ),),
                      child:
                                
                         Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                " Tasks",
                                style: TextStyle(
                                  fontFamily: 'Kings',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: darkbeige,
                                  fontSize: 30,
                                ),
                              ),
                               SizedBox(width: MediaQuery.of(context).size.width * 0.27,),
                                IconButton(
                                        onPressed: () async {
                                          await logoutprovider(Url.Token_prov);
                                           Securestorage storage=new Securestorage();
                                            await storage.delete('token_provider') ;
                                              await storage.delete('id_prov_reg');
                                                await storage.delete('id_provider');
                                           await storage.delete('token_prov_reg') ;
                                             Get.offNamed('/signupfirst');


                                            
                                        //  logoutprovider(Url.Token_prov);
                                        },
                                        //  Get.toNamed('/points'),
                                        icon: Icon(Icons.logout_outlined),
                                        color: darkbeige,
                                        iconSize: 28,
                                      ), 
                    
                        ],),
                         SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                         Row(children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                            Icon(Icons.check_box_rounded,color: pink,size: 25,),
                             SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                             Text(
                                " Taski",
                                style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
                               Obx(() => 
                                controller.task_load.value?
                           Text(""):
                               Text(
                                " ${controller.task.myTasks.name}",
                                style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),),
                           Obx(() => 
                              controller.task_load.value?
                           Text(""): 
                                InkWell(
                                  onTap: () {
                                    controller1.fetchProfileProvider();
                                    Get.toNamed('/profileProvider');
                                  },
                                  child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: const EdgeInsets.only(left: 10),
                                                decoration:  BoxDecoration(
                                    color: Colors.grey.shade200, // لون خلفية التبويب
                                    borderRadius: BorderRadius.circular(10.0),
                                    
                                    image: 
                                    // controller.task.myTasks.profileImageUrl==null? 
                                    DecorationImage(
                                                        image:
                                  AssetImage('assets/images/default.png',),
                                                        fit: BoxFit.cover)
                                                        // :
                                  //                      DecorationImage(
                                                      
                                                      
                                  //                         image: NetworkImage('${Url.domain}' +
                                  //                         '${controller.task.myTasks.profileImageUrl}'),
                                                       
                                                      
                                  // // شكل الحواف
                                  // ),
                                  
                                  )
                                              ),
                                ),)
                         ],),
                    
                             //  Obx(() {
                      //   if (controller.isloading.isTrue) {
                      //     return Center(
                      //       child: Column(
                      //         children: [
                      //           SizedBox(
                      //             height: 50,
                      //           ),
                      //           CircularProgressIndicator(),
                      //         ],
                      //       ),
                      //     );
                      //   }
                      //   return
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                              Row(children: [
                                 SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                                 const Text(
                                " Welcome ,",
                                style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(137, 0, 0, 0),
                                  fontSize: 20,
                                ),
                              ),
                              Obx(() => 
                                controller.task_load.value?
                           Text(""):
                        Text(
                                " ${controller.task.myTasks.name}",
                                style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(211, 179, 152, 1),
                    
                                  fontSize: 20,
                                ),
                              ),)
                              
                              ],),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                               Row(children: [
                                 SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                                  Obx(() => 
                                controller.task_load.value?
                           Text("You’ve got ${controller.task.myTasks.tasks.length}tasks to do"):
                                  Text(
                                " You’ve got ${controller.task.myTasks.tasks.length}tasks to do.",
                                style: TextStyle(
                                  fontFamily: 'OleoScript',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.normal,
                                  color: const Color.fromRGBO( 114, 137, 148,0.8),
                                  fontSize: 17,
                                ),
                              ),)
                              ]),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                 Row(children: [
                                 SizedBox(width: MediaQuery.of(context).size.width * 0.5,),
                                   ElevatedButton(
                          onPressed: (){
                            Url.show_id_provider=int.parse(Url.saved_id_prov);
                            Get.toNamed('/posts'); },
                          style: ElevatedButton.styleFrom(
                          backgroundColor: pink,
                            minimumSize: Size(MediaQuery.of(context).size.width * 0.08, MediaQuery.of(context).size.height * 0.05),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                          ),
                          child: Row(
                            children: [
                              TextUtils(
                                color: Colors.white,
                                text: "My Posts            ",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                
                                fontfamily: 'OleoScript',
                                underLine: TextDecoration.none,
                              ),
                              Icon(Icons.post_add,color: Colors.white,size: 25,),
                            ],
                          ),
                        ),
                        //                 
                                 ]),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                              Expanded(
                                  child: Obx(()=>
                                                     controller.task_load.value?
                                                                         Center(child: CircularProgressIndicator()):
                                                                      controller.task.myTasks.tasks.length== 0?
                                                                        Center(child: Text('There are no Tasks')): ListView.separated(
                                                        separatorBuilder: (context, index) =>
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                        itemCount: controller.task.myTasks.tasks.length,
                                                        itemBuilder: (context, index) {
                                                          controller.isSelected.value = controller
                                                              .selectedIndices
                                                              .contains(index);
                                                          return Task_Card(index);
                                                        })
                                                                       )
                                  ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),   
                            ])
                              ),
                ),
               ),
              )
   );
                
             
  }
  
  Future<void> logoutprovider(String token )async {

    var url=Uri.parse(Url.domain+Url.logoutprovider);
    print(url);
    print(token);
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
       'Authorization': 'Bearer ${Url.Token_prov}',
      },


    );
    print(response.body);
    print(response.statusCode);

  }

   Future<void>_handleRefresh() async{
              print("refresh");
  controller.task_load.value=true;
  await controller.GetTasks();
  print("task");
  

  return await Future.delayed(const Duration(seconds:1));
}
}
