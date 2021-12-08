import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/page/my_cart/widget_my_cart/checkout.dart';
import 'package:order_app/page/my_cart/widget_my_cart/item_my_cart.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                appBarTheme(context,title: "My Cart"),
                const Divider(),
                Expanded(
                  child: GetBuilder<MyCartController>(
                    init: MyCartController(),
                    builder: (controller) {
                      return ListView.separated(
                        itemCount: controller.listDataProduct.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => ItemCart(product: controller.listDataProduct[index],),);
                    }
                  ),
                ),
                const SizedBox(height: 300,)
              ],
            ),
            Positioned(
              bottom:20,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Button(fontSize: 18,nameButton: "Go to Checkout",onTap: (){
                      Get.bottomSheet(const Checkout(),isScrollControlled: true);
                    },),
                    Positioned(
                      right: 24,
                        child: Container(
                          alignment: Alignment.center,
                          height: 22,
                          width: 43,
                          decoration: const BoxDecoration(
                            color: Color(0xff489E67),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child: Text("\$12.98", style: TextStyle(color: Colors.white, fontSize: 12),),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
