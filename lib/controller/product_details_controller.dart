import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/addition_modelb.dart';
import 'package:new_proj/models/product_details_model.dart';


class ProductDetails_controller extends GetxController {
  var isLoading = false.obs;
  int stats_added = 0;
  RxBool likeStatus =false.obs;
  RxString current = ''.obs;
  RxInt quantity = 1.obs;
  RxInt is_quantity = 1.obs;
  int rate = 3;
  RxInt love = 0.obs;
  RxInt rating = 0.obs;

  var product = ProductDetailsModel(
    id: 0,
    collectionId: 0,
    name: '',
    price: '',
    quantity: 0,
    description: '',
    size: [],
    isActive: false,
    inStock: false,
    onSale: false,
    image: '',
    additions: [],
  ).obs;

  var additions = <Addition>[].obs;
  var quan = <int>[].obs;
  List <ProductDetailsModel> ProductI =[];
  List <Addition> additionsI =[];
  List<int>quantitiesProduct=[];
  List<String>sizeProduct=[];
  List<int>quantitiesAdditions=[];
  @override
  void onInit() async {
    super.onInit();
    await fetchProduct();
    fetchAdditions();
    fetchLikeStatus();
    ever(additions, (_) {
      initializeQuan();
    });
  }


  Future add_rate() async {
    try {
      print('rate  ' + rating.value.toString());
      print('user   ' + Url.saved_id_user.toString());
      print('product   ' + Url.id_product.toString());
      print(rate);
      var response = await http.post(

          Uri.parse('${Url.domain}/api/v1/product/add-review'),
          headers: {
            //'Authorization': 'Bearer ${url.Token}',
            'Accept': 'application/json',
          },
          body: {
            'user_id': Url.saved_id_user.toString(),
            'product_id': Url.id_product.toString(),
            'rate': rating.value.toString(),
          });
      var res = jsonDecode(response.body);
      print(res);
      stats_added = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        //EasyLoading.showSuccess("successfully rated");
        print(response.statusCode);
        print("rate  added");
      } else {
        EasyLoading.showError(res);
        print("response ");
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("error message   ");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
  Future  loveOrUnlove() async {
    try {
      print('love  ' + love.toString());
      print('user   ' + Url.saved_id_user.toString());
      print('product   ' + Url.id_product.toString());
      var response = await http.post(
          Uri.parse('${Url.domain}/customer/products/${Url.id_product}/like-or-unlike'),
          headers: {
            'Authorization': 'Bearer ${Url.Token_user}',
            'Accept': 'application/json',
          },
          body: {
            'user_id': Url.saved_id_user.toString(),
          });
      var res = jsonDecode(response.body);
      print(res);
      stats_added = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        var responsejson=jsonDecode(response.body);
        print(responsejson['likes']);
        love.value=responsejson['likes'];
        print('love  ' + love.toString());
        print(response.statusCode);
      } else {
        EasyLoading.showError(res);
        print("response ");
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("error message   ");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
  Future<void> fetchLikeStatus() async {
    try {
      final response = await http.get(
        Uri.parse('${Url.domain}/customer/products/${Url.id_product}'),
        headers: {
          'Authorization': 'Bearer ${Url.Token_user}',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final data = json.decode(response.body);
        likeStatus(LikeStatus.fromJson(data).isLiked);

      } else {
        Get.snackbar('Error', 'Failed to load like status');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {

    }
  }
  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse('${Url.domain}/api/v1/product/show/${Url.id_product}'));
    isLoading(false);
    if (response.statusCode == 200) {
      isLoading(true);
       var jsonResponse = json.decode(response.body);
       product.value = ProductDetailsModel.fromJson(jsonResponse['product']);
       print(jsonResponse);
    } else {
      isLoading(false);
      throw Exception('Failed to load product');
    }
  }
  void initializeQuan() {
    quan.value = List<int>.filled(additions.length, 1);
  }

  void fetchAdditions() async {
    try {
      //isLoading(true);
      var response = await http.get(Uri.parse('${Url.domain}/api/v1/all-additions'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        List<Addition> fetchedAdditions = [];
        for (var item in data['additions']) {
          fetchedAdditions.add(Addition.fromJson(item));
        }
        additions.assignAll(fetchedAdditions);
      } else {
        print('Failed to load data');
      }
    } finally {
     // isLoading(false);
    }
  }
  Future<void> add_to_cart() async {
    try {


      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Url.Token_user}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Url.domain}/customer/cart'));

      for (int i = 0; i < ProductI.length; i++) {
        request.fields.addAll({
          'items[$i][product_id]': '${ProductI[i].id}',
          'items[$i][quantity]': '${quantitiesProduct[i]}',
          'items[$i][size][]': '${sizeProduct[i]}',
        });
        print(  'items[$i][product_id]'+'${ProductI[i].id}  '  +
          'items[$i][quantity]    '+ '${quantitiesProduct[i]}  '+
          'items[$i][size]    '+ '${sizeProduct[i]}',);
        //product.value[i].additions.length
        if(additionsI.isNotEmpty){
          for (int j = 0; j < additionsI.length; j++) {
            request.fields.addAll({
              'items[$i][additions][$j][addition_id]': '${additionsI[j].id}',
              'items[$i][additions][$j][quantity]': '${quantitiesAdditions[j]}',

            });
            print('items[$i][additions][$j][addition_id]    '+'${additionsI[j].id}   '+
                'items[$i][additions][$j][quantity]  ' + '${quantitiesAdditions[j]}');

          }
        }
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      //status_addtocart = response.statusCode;
      print(responseBody);

      if (response.statusCode == 201 || response.statusCode == 200) {
        
        print(response.statusCode);
        print("okkkkk added");
        EasyLoading.showSuccess("Successfully added to cart ");
      } else {
        print(response.statusCode);
        print("not okkk added");
        print(response.request);
        EasyLoading.showError(jsonDecode(responseBody)['message']);
      }
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString());
    }
  }



 }
