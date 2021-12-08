import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:order_app/controllers/beverages_controller.dart';
import 'package:order_app/page/find_products/widget_find/item_find.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/card/card.dart';

class Beverages extends StatelessWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<BeveragesController>(
          init: BeveragesController(),
          builder: (controller) {
            return Column(
              children: [
                appBarTheme(context,title: Get.arguments, iconLeading: const Icon(Icons.arrow_back_ios), iconAction: SvgPicture.asset("assets/icons/filters.svg"), onPressedLeading: ()=> Get.back()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GridView.builder(
                      itemCount: controller.listProduct.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisExtent: 248,
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        return cardItem(product: controller.listProduct[index], idProduct: controller.listProduct[index].id);
                      }),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
