

import 'package:get/get.dart';
import 'package:new_proj/consts/url.dart';

import 'package:new_proj/models/cart_model.dart';
import 'package:new_proj/serves/cart_serves.dart';


class CartController extends GetxController {
  MyCart cartlist = MyCart(id: 0, userName: '',
      items: [], customBouquets: []);

  cartserves serves = cartserves();
  var isloading = true.obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    cartlist = await serves.getcart(Url.Token_user);
//print(productlist[0].img_url);

    isloading(false);
    super.onReady();
  }

}
