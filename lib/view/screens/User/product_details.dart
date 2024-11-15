import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:new_proj/controller/home_controller.dart';
import 'package:new_proj/controller/product_details_controller.dart';

import 'package:new_proj/view/widget/button_gradient.dart';
import 'package:new_proj/view/widget/text.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/url.dart';

class ProductDetails extends StatelessWidget {
  
  final ProductDetails_controller controller = Get.find();
    var controller1 = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: backColor,
          ),
          child: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15,),
                  child: Obx(() {

                    if (!controller.isLoading.value) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 400.0, ),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    else{
                      final product = controller.product.value;
                      return
                        Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.navigate_before),
                                iconSize: 25,
                                color: Colors.brown,
                              ),
                            ],
                          ),
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.brown,
                            ),
                            child: product.image != null && controller.product.value.image!.isNotEmpty
                                ? Image.network(
                              '${Url.domain}${product.image}',
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            )
                                : Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextUtils(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    text: '${product.name}',
                                    color: Color(0xFF8B7475),
                                    underLine: TextDecoration.none,
                                    fontfamily: 'OleoScript',
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(2),
                                              ),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.redAccent,
                                                  blurRadius: 0.01,
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.quantity.value++;
                                              print(controller.quantity.value);
                                            },
                                            icon: Icon(Icons.add,
                                                color: Colors.black, size: 18),
                                          ),
                                        ],
                                      ),
                                      TextUtils(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        text: controller.quantity.value > 0
                                            ? '0${controller.quantity.value}'
                                            : '01',
                                        color: Colors.black,
                                        underLine: TextDecoration.none,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(2),
                                              ),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.redAccent,
                                                  blurRadius: 0.01,
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.quantity.value--;
                                              print(controller.quantity.value);
                                            },
                                            icon: Icon(Icons.minimize_sharp,
                                                color: Colors.black, size: 18),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      text: 'AED \$${product.price}',
                                      color: Color(0xFF796F14),
                                      underLine: TextDecoration.none,
                                      fontfamily: 'OleoScript',
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 27,
                                      itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double rating) async {
                                        int intValue = rating.round();
                                        controller.rating.value = intValue;
                                        await controller.add_rate();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    // Icon(
                                    //   Icons.star,
                                    //   color: Colors.amber,
                                    //   size: 22,
                                    // ),
                                    // TextUtils(
                                    //   fontSize: 17,
                                    //   fontWeight: FontWeight.bold,
                                    //   text: '${product.rate}',
                                    //   color: Color(0xFF796F14),
                                    //   underLine: TextDecoration.none,
                                    //   fontfamily: 'OleoScript',
                                    // ),
                                    TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      text: 'Quantity   ${product.quantity}',
                                      color: Color(0xFF796F14),
                                      underLine: TextDecoration.none,
                                      fontfamily: 'OleoScript',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextUtils(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                text: 'Select Size',
                                color: Colors.brown,
                                underLine: TextDecoration.none,
                                fontfamily: 'OleoScript',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: product.size!.map((size) {
                                  return InkWell(
                                    onTap: () {
                                      controller.current.value = size;
                                      print(size);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: controller.current.value == size
                                              ? Colors.brown.withAlpha(80)
                                              : Colors.white.withAlpha(20),
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            color: Colors.black26,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: TextUtils(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          text: size,
                                          color: Colors.grey,
                                          underLine: TextDecoration.none,
                                          fontfamily: 'OleoScript',
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height:10 ,
                              ),
                              TextUtils(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                text: 'Description',
                                color: Colors.brown,
                                underLine: TextDecoration.none,
                                fontfamily: 'OleoScript',

                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextUtils(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                text: controller.product.value.description,
                                color: Colors.black45,
                                underLine: TextDecoration.none,
                                fontfamily: 'OleoScript',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 250, // Adjust height as per your requirement
                                child:
                                Obx(() {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.additions.length,
                                    itemBuilder: (context, index) {
                                      var item = controller.additions[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 160, // Adjust width of each item container
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.8),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(0, 2), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 2.0),
                                                child: Center(
                                                  child: Container(
                                                    width: 150,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: item.imageUrl != null && item.imageUrl.isNotEmpty
                                                        ? ClipRRect(
                                                      borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(8),
                                                      ),
                                                      child: Image.network(
                                                        '${Url.domain}${item.imageUrl}',
                                                        width: 140,
                                                        height: 90,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                        : ClipRRect(
                                                      borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(8),
                                                      ),
                                                      child: Icon(
                                                        Icons.image,
                                                        size: 100,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      TextUtils(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        text: '${item.name}',
                                                        color: Colors.black,
                                                        underLine: TextDecoration.none,
                                                        fontfamily: 'OleoScript',
                                                        maxline: 1,
                                                      ),
                                                      SizedBox(height: 4),
                                                      TextUtils(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        text: '\$ ${item.price.toStringAsFixed(2)}',
                                                        color: Color(0xFF8B7475),
                                                        underLine: TextDecoration.none,
                                                        fontfamily: 'OleoScript',
                                                      ),
                                                      SizedBox(height: 5),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 16.0),
                                                        child: Row(
                                                          children: [
                                                            Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(2),
                                                                    ),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.brown,
                                                                        blurRadius: 0.01,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {
                                                                    controller.quan[index]++;
                                                                    print(controller.quan[index]);
                                                                  },
                                                                  icon: Icon(Icons.add,
                                                                      color: Colors.black, size: 18),
                                                                ),
                                                              ],
                                                            ),
                                                            Obx(() {
                                                              return TextUtils(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold,
                                                                text: controller.quan[index] > 0
                                                                    ? '0${controller.quan[index]}'
                                                                    : '01',
                                                                color: Colors.black,
                                                                underLine: TextDecoration.none,
                                                              );
                                                            }),
                                                            Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(2),
                                                                    ),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.brown,
                                                                        blurRadius: 0.01,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {
                                                                    if (controller.quan[index] > 1) {
                                                                      controller.quan[index]--;
                                                                      print(controller.quan[index]);
                                                                    }
                                                                  },
                                                                  icon: Icon(Icons.minimize_sharp,
                                                                      color: Colors.black, size: 18),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      GestureDetector(
                                                        onTap: () {
                                                          EasyLoading.showSuccess("addition added sucessfull...");
                                                          controller.additionsI.add(item);
                                                          controller.quantitiesAdditions.add(controller.quan[index]);
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 33,
                                                          decoration: BoxDecoration(
                                                            color: Colors.brown.shade300,
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Add',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 37,
                                    height: 37,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.redAccent,
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: ()async {
                                      controller.likeStatus.value = !controller.likeStatus.value;
                                      await controller.loveOrUnlove();

                                    },
                                    icon: Icon(
                                      controller.likeStatus.value
                                          ? Icons.favorite_sharp
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Obx(() =>
                              controller.product.value.quantity==0?
                                TextUtils(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                text: "The quantity is out of stock.",
                                color: Colors.red.shade800,
                                underLine: TextDecoration.none,
                                fontfamily: 'OleoScript',
                              ):
                              Basic_Button(
                                text: 'ADD TO CART',
                                width: MediaQuery.of(context).size.width * 0.5,
                                hight: 44,
                                onPressed: () async{
                                   if (Url.Token_user == "")
                                 controller1.openDialog(context);
                           else {
                            await EasyLoading.show(status: "loading");
                                  controller.ProductI.add( controller.product.value);
                                  controller.quantitiesProduct.add(controller.quantity.value);
                                  controller.sizeProduct.add(controller.current.value);
                                  print("indexes ");
                                  //print( controller.indexes.value);
                                  await controller.add_to_cart();
                                   Get.back();
                                   }
                                },
                              ))

                            ],
                          ),
                          SizedBox(
                            height:20 ,
                          ),
                        ],
                      );}

                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
