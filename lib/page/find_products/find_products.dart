import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:order_app/controllers/find_products_controller.dart';
import 'package:order_app/page/find_products/widget_find/item_find.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/text_field/search.dart';

class FindProducts extends StatelessWidget {
  const FindProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FindProductsController>(
          init:  FindProductsController(),
          builder: (controller) {
            return Column(
              children: [
                appBarTheme(context,title: "Find Products",),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: search(textEditingController: controller.textEditingController,
                      onEditingComplete: () => Get.toNamed(Routes.SEARCH, arguments: controller.textEditingController.text)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                    child: GridView.builder(
                      itemCount: controller.list.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15
                      ),
                      itemBuilder: (BuildContext context, int index){
                        return ItemFind(index: index);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        )
        ),
    );
  }
}
