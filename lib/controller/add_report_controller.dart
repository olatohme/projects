import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../consts/url.dart';

class AddReportControoler extends GetxController {
  int stats_added = 0;
  var report='';

  Future add_report() async {
    try {
      print('report   '+report);
      var response = await http.post(
          Uri.parse('${Url.domain}/customer/report'),
          headers: {
            'Authorization': 'Bearer ${Url.Token_user}',
            'Accept': 'application/json',
          },
          body: {
            'description':report,
          });
      var res = jsonDecode(response.body);
      print(res);
      stats_added = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess("Report submitted successfully");
        print(response.statusCode);
        print("added  report");
      } else {
        EasyLoading.showError(res);
        print("response ");
        print(stats_added);
      }
    } catch (e) {
      print("error");
      print("error message   ");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }

}