import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/view/widget/button.dart';
import '../../consts/url.dart';
import '../../controller/search_provider_controller.dart';
// ignore: must_be_immutable
class search_provider_card extends StatelessWidget {

  int index;
  search_provider_card (this.index);
  var controller1 = Get.find<SearchProviderController>();
  @override
  Widget build(BuildContext context) {
    print(controller1.providers[index].id);
    return InkWell(
      onTap: () {
        Url.show_id_provider =controller1.providers[index].id;
        Get.toNamed('/showprovider');},
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color:   Color.fromRGBO( 211, 179, 152 ,0.5),
          borderRadius: BorderRadius.circular(17),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 3.0,
          //     blurRadius: 5.0,
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 130,
              width: 130,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(100),
                // image: DecorationImage(
                //   image:
                //   AssetImage('assets/images/profile.png',),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: controller1.providers[index].profileImageUrl != null && controller1.providers[index].profileImageUrl !.isNotEmpty
                  ? Image.network(
                '${Url.domain}${controller1.providers[index].profileImageUrl}',
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "${controller1.providers[index].name}",
                      style: TextStyle(
                        fontFamily: 'OleoScript',
                        overflow: TextOverflow.ellipsis,
                        color: darkbeige,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${controller1.providers[index].email}",
                      style: TextStyle(
                        fontFamily: 'OleoScript',
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Button(
                      onPressed: () {
                      },
                      text: "Info",
                      hight: 30,
                      width: 100,
                      color: pink,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
