import 'dart:async';
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/url.dart';

import '../models/tasks_model.dart';

import 'package:http/http.dart' as http;

class TasksController extends GetxController {
  List<int> selectedIndices = [];
  RxBool task_load=true.obs;
    RxBool isDialogOpen=false.obs;
  
  int status_complete=0;
@override
  void onInit() {
    super.onInit();
    if(Url.id_provider!=1000)
       GetTasks();
    
  }
  RxBool isSelected = false.obs;
  int status_task=0;
  Tasks task =new Tasks(myTasks:MyTasks(id: 0, name: "", email: "", phone: 0,profileImageUrl:"", tasks: [], isActive: 2) );
  
  Future<Tasks> GetTasks() async {
    try {
      print("${Url.domain}/api/v1/task/my-tasks/${Url.saved_id_prov}");
      var headers = {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${Userinformation.Token}'
      };
      var request = http.Request(
        'GET',
       
        Uri.parse("${Url.domain}/api/v1/task/my-tasks/${Url.saved_id_prov}")
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_task= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        task_load.value=false;
        print("yesss gettask");
        print(response.statusCode);

        task =tasksFromJson(responseBody);
        //  print("ooooooooooooooo");
        // print(res);

        //
        //profile = res;
        return task;
      } else {
        print(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print("noo gettask");
        return task;
      }
    } catch (e) {
      print(e);
      return task;
    }
  }


  Future Complete_task() async {
    
    try {
      final response = await http.put(
    Uri.parse('${Url.domain}/api/v1/task/${Url.task_id}/complete'),
    headers: <String, String>{
     'Accept': 'application/json',
     'Content-Type': 'application/json',
     'Authorization': 'Bearer ${Url.Token_prov}'
    },
    body: jsonEncode(<String, bool>{
      'completed': true,
    }),
  );

      
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        status_complete= response.statusCode;
     
        print(response.statusCode);
        print("okkkkk done");
         EasyLoading.showSuccess("This task done successfully");
      
      } else {
        // print(token);
        print(response.statusCode);
        print("not okkk done");
        print(response.request); 
         EasyLoading.showError("Failed done this task");
        //update();
      }
    } catch (e) {
      print(e);
       EasyLoading.showError(e.toString());
    }
  }

  }