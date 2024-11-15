import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../consts/url.dart';

class AddAddressController extends GetxController {
  int stats_added = 0;
  var user_id='';
  var street='';
  var line_one = '';
  var line_two = '';
  var city = 'Damascus'.obs;
  var country_name = 'Syria'.obs;
  var country_id = '';
  Future add_address() async {
    try {
      print('user_id   '+user_id);
      print('city    '+city.value);
      print('country'+country_id);
      print('line_one    '+line_one);
      print('line_two    '+line_two);
      print('street  '+street);
      var response = await http.post(
          Uri.parse('${Url.domain}/api/v1/address/create'),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'user_id': user_id,
            'city':city.value,
            'country_id':country_id,
            'line_one':line_one,
            'line_two': line_two,
            'street':street
          });
      var res = jsonDecode(response.body);
      print(res);
      stats_added = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        EasyLoading.showSuccess("added successfully ");
        print(response.statusCode);
        print("added  address");
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