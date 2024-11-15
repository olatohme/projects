
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/tasks_controller.dart';
import 'package:new_proj/view/widget/text.dart';



// ignore: must_be_immutable
class Task_Card extends StatefulWidget {
  int index = 0;
  
  int numberOfLines = 0;
  Task_Card(this.index);
  @override
  _CardListState createState() => _CardListState(this.index);
}

class _CardListState extends State<Task_Card> {
//class Card_file extends StatelessWidget {
  int index = 0;
  _CardListState(this.index);
  Color checkboxColor = Colors.grey;

  // FileElement file;
  // String extintion = "";

  
  int idgroup = 0;
  var controller = Get.find<TasksController>();
 
  // GlobalKey _buttonKey = GlobalKey();


  

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
             openDialog(context);
            // if (controller.isSelected.value) {
            //   controller.selectedIndices
            //       .remove(controller.filemodel!.files[index].id);
            // } else {
            //   controller.selectedIndices
            //       .add(controller.filemodel!.files[index].id);
            // }
            //   if (controller.isSelected.value) {
            //   controller.selectedIndices
            //       .remove(index);
            // } else {
            //   controller.selectedIndices
            //       .add(index);
            // }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            color: Color.fromRGBO( 211, 179, 152 ,0.3),
            borderRadius: BorderRadius.circular(16),
          
          
          ),
          child: Stack(
                          children: [
                            Positioned(
                              left: 70,
                              top: 17,
                              child: 
                                  Text(
                                    '${controller.task.myTasks.tasks[index].title}',
                                    style: TextStyle(
                                       fontFamily: 'OleoScript',
                                      color: Color(0xFF796F15),
                                      fontSize: 16,
                                      
                                      fontWeight: FontWeight.w200,
                                      height: 0,
                                    ),
                                  ),
                                  
                               
                            ),
                             Positioned(
                              left: 240,
                              top: 17,
                              child:
                                 controller.task.myTasks.tasks[index].completed==true?
                                 Row(
                                   children: [
                                     Text(
                                        'Completted',
                                        style: TextStyle(
                                           fontFamily: 'OleoScript',
                                          color: Colors.green.shade600,
                                          fontSize: 13,
                                          
                                          fontWeight: FontWeight.w200,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Icon(Icons.done,color: Colors.green.shade600,size: 20,),

                                   ],
                                 ): 
                                  
                                    Row(
                                      children: [
                                        Text(
                                        'Not Completted',
                                        style: TextStyle(
                                           fontFamily: 'OleoScript',
                                          color: Colors.red.shade600,
                                          fontSize: 13,
                                          
                                          fontWeight: FontWeight.w200,
                                          height: 0,
                                        ),
                                                                          ),
                                                                            SizedBox(width: 5,),
                                      Icon(Icons.close,color: Colors.red.shade600,size: 20,),
                                      ],
                                    )
                                
                              ), 
                            Positioned(
                              left: 16,
                              top: 10,
                              child:controller.task.myTasks.tasks[index].completed==false? Checkbox(
                                hoverColor: pink,
                                 side: BorderSide(color: pink, width: 2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: controller.selectedIndices
                      .contains(index),
                  activeColor: pink,
                  onChanged: (value) async{
                    setState(()  {
                      if (value != null) {
                        if (value) {
                          Url.task_id=controller.task.myTasks.tasks[index].id;
                          controller.selectedIndices
                              .add(index);
                              controller.Complete_task();
                              controller.task_load.value=true;
                              // if (controller.status_complete == 201 || controller.status_complete == 200)
                              controller.GetTasks();
                        } else {
                          controller.selectedIndices
                              .remove(index);
                        }
                      }
                    });
                  }):Text("")
                            ),
                            Positioned(
                              left: 70,
                              top: 48,
                              child: Text(
                                 '${controller.task.myTasks.tasks[index].dueDate}',
                                style: TextStyle(
                                  color: Color(0xFF908A8A),
                                  fontSize: 15,
                                   fontFamily: 'OleoScript',
                                  fontWeight: FontWeight.w100,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
         
        ));
  }

  void openDialog(BuildContext context) {
    controller.isDialogOpen.value = true;
    
    Get.dialog(
        barrierDismissible: false,
      SizedBox(
        // width: 1000,
        child: AlertDialog(
          backgroundColor: Colors.white ,
           insetPadding: EdgeInsets.symmetric(vertical: 120,horizontal:0 ),
     
          
          content: SizedBox(
          width: double.infinity, // جعل عرض الـ dialog يمتد على عرض الشاشة
          child: SingleChildScrollView(
            child: Column(children: [   SizedBox(height: 10,),
      TextUtils(
            fontSize: 23,
                      fontWeight: FontWeight.bold,
                    
                      text: '${   controller.task.myTasks.tasks[index].title}',
                      color: pink,
                      underLine: TextDecoration.none,
          fontfamily: 'OleoScript',
                                    ),
                                      SizedBox(height: 10,),
         TextUtils(
            fontSize: 10,
                      fontWeight: FontWeight.bold,
                    
                      text: '${   controller.task.myTasks.tasks[index].description}',
                      color: Colors.black54,
                      underLine: TextDecoration.none,
          fontfamily: 'OleoScript',
                                    ),
                  SizedBox(height: 10,),
         TextUtils(
            fontSize: 15,
                      fontWeight: FontWeight.bold,
                    
                      text: '${   controller.task.myTasks.tasks[index].priority}',
                      color: Colors.black54,
                      underLine: TextDecoration.none,
          fontfamily: 'OleoScript',
                                    ),
                                     SizedBox(height: 10,),
         TextUtils(
            fontSize: 15,
                      fontWeight: FontWeight.bold,
                    
                      text: '${   controller.task.myTasks.tasks[index].dueDate}',
                      color: Colors.black54,
                      underLine: TextDecoration.none,
          fontfamily: 'OleoScript',
                                    ),



  ]),
  
  ),
    )
          
          // actions: [
          //   Center(
          //     child: Button(
          //       onPressed: () async {
                 
          //       },
          //       text: "ارسال",
          //       hight: 50,
          //       width: 200,
          //     ),
          //   ),
          //   SizedBox(
          //     height: 20,
          //   )
          // ],
       
    
       )
       
       )
        );
  }

  
}
