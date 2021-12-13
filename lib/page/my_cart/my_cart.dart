import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/page/my_cart/widget_my_cart/checkout.dart';
import 'package:order_app/page/my_cart/widget_my_cart/item_my_cart/item_my_cart.dart';
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
                appBarTheme(context, title: "My Cart"),
                const Divider(),
                Expanded(
                    child: GetBuilder<MyCartController>(builder: (controller) {
                  return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: controller.streamCart,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading");
                        }
                        if (snapshot.hasData) {
                          controller.listCart =
                              snapshot.data!.data()!.keys.toList();
                          return ListView.separated(
                              itemCount: controller.listCart.length,
                              separatorBuilder: (context, index) =>
                              const Divider(),
                              itemBuilder: (context, index) {
                                return FutureBuilder<Product> (
                                  future: controller.getItemDataProduct(idProduct: controller.listCart[index]),
                                    builder: (context, snapshotF) {
                                      if(snapshotF.hasData){
                                        return ItemCart(product: snapshotF.data!,);
                                      }
                                      return const Center(child: CircularProgressIndicator(),);
                                    },);
                              });
                        }
                        return Text("home1");
                      });
                }))
              ],
            ),
            Positioned(
                bottom: 20,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Button(
                      fontSize: 18,
                      nameButton: "Go to Checkout",
                      onTap: () {
                        Get.bottomSheet(const Checkout(),
                            isScrollControlled: true);
                      },
                    ),
                    Positioned(
                        right: 24,
                        child: Container(
                          alignment: Alignment.center,
                          height: 22,
                          width: 43,
                          decoration: const BoxDecoration(
                              color: Color(0xff489E67),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: GetBuilder<MyCartController>(
                              init: MyCartController(),
                              builder: (controller) {
                                return Text(
                                  controller.total.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                );
                              }),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
