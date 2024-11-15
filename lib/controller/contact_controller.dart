import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/models/contact_model.dart';
import 'package:new_proj/consts/url.dart';
class ContactController extends GetxController {
  var contact = Contact(email: "", address: "", phone: "").obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  void fetchData() async {
    print('in fetch contact us');
    var url = Uri.parse('${Url.domain}/api/v1/contact');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonResponse = json.decode(response.body);
      contact(Contact.fromJson(jsonResponse['contact_us'][0]));
    } else {
      print('Failed to load contact information');
      print(response.statusCode);
    }
  }
}
