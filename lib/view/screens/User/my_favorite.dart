import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/controller/my_favorite_controller.dart';
import 'package:new_proj/view/widget/product_search_card.dart';
import '../../../consts/colors.dart';
import '../../../models/my_favorite _model.dart';
import '../../../../consts/url.dart';
import '../../widget/text.dart';
class MyFavorite extends StatelessWidget {
  MyFavorite({Key? key}) : super(key: key);
  final MyFavoriteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: ShapeDecoration(
              gradient: backColor,
              shape: RoundedRectangleBorder(),
            ),
            child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.chevron_left),
                        color: Colors.brown,
                        iconSize: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.20),
                      TextUtils(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        text: "My Favorite",
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Expanded(
                        child:
                        Obx(() {
      
                          if (controller.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
      
                          if (controller.likedProducts.isEmpty) {
                            return Center(
                              child: TextUtils(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                text: "No Favorite Found",
                                color: Colors.brown,
                                underLine: TextDecoration.none,
                                fontfamily: 'OleoScript',
                              ),
                            );
                          }
                          else{
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.likedProducts.length,
                              itemBuilder: (context, index) {
                                var item = controller.likedProducts[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0,top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2.0),
                                        child: InkWell(
                                          onTap: (){
                                            print("id is${item.id}");
                                            Url.id_product=item.id;
                                            Get.offNamed('/ProductDetails');
                                          },
                                          child: Center(
                                            child: Container(
                                              width: 290,
                                              height: 220,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(8),
                                                ),
                                              ),
                                              child: item.image != null && item.image.isNotEmpty
                                                  ? ClipRRect(
                                                borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(8),
                                                ),
                                                child: Image.network(
                                                  '${Url.domain}${item.image}',
                                                  width: 140,
                                                  height: 90,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                                  : ClipRRect(
                                                borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(10),
                                                  bottom: Radius.circular(10),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              TextUtils(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                text: '${item.name}',
                                                color: Colors.black,
                                                underLine: TextDecoration.none,
                                                fontfamily: 'OleoScript',
                                                maxline: 1,
                                              ),
                                              SizedBox(height: 4),
                                              TextUtils(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                text: '\$ ${item.price}',
                                                color: Color(0xFF8B7475),
                                                underLine: TextDecoration.none,
                                                fontfamily: 'OleoScript',
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );}
                        }),
      
                  )
                ]))
      ),
    );
  }
}