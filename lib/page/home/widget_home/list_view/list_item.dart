import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:order_app/controllers/home_controller.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/widgets/card/card.dart';


String urlImg = "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872";

class ListItem extends StatelessWidget {
  final List<Product>? listProduct;

  const ListItem({Key? key, this.listProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => listProduct!.isNotEmpty
          ? SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listProduct!.length,
          itemBuilder: (context, index) => cardItem(
            product: listProduct![index]),),
      )
          : Text("Chưa có khuyến mãi"),
    );
  }
}
