import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/utils/text_styte.dart';
import 'item_my_cart_controller.dart';

class ItemCart extends StatelessWidget {
  final Product product;
  const ItemCart({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ItemMyCartController controller = Get.put(ItemMyCartController(product: product),tag: product.id);
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            child: Stack(
              children: [
                GetBuilder<ItemMyCartController>(
                  init: ItemMyCartController(product: product),
                  builder: (controller) {
                    return Positioned(
                      top: 0,
                      right: 25,
                      child: InkWell(
                        onTap: () {
                          FunctionFireBase.deleteMyCart(product: product);
                        },
                        child: Icon(
                          Icons.clear,
                          color: ColorApp.greyColor,
                        ),
                      ),
                    );
                  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        color: Colors.teal,
                        child: Image.network(
                          product.img[0],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return const Center(
                                child: CircularProgressIndicator());
                            // You can use LinearProgressIndicator or CircularProgressIndicator instead
                          },
                          errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.clear),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 241,
                      height: 120,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: Font.fontBold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.description.substring(0, 30),
                                style: const TextStyle(
                                    fontSize: 14, fontFamily: Font.fontLight),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              GetBuilder<ItemMyCartController>(
                                id: product.id,
                                init: controller,
                                tag: product.id,
                                builder: (controller) {
                                  return Row(
                                    children: [
                                      buttonClick(
                                          add: false,
                                          onTap: () {
                                            controller.minusProduct(idProduct: product.id);
                                          }),
                                      const SizedBox(
                                        width: 17.45,
                                      ),
                                      Text(controller.countProduct.toString()),
                                      const SizedBox(
                                        width: 17.45,
                                      ),
                                      buttonClick(
                                          add: true,
                                          onTap: () {
                                            controller.addProduct(idProduct: product.id);
                                          }),
                                    ],
                                  );
                                }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                GetBuilder<ItemMyCartController>(
                  id: product.id,
                  tag: product.id,
                  init: controller,
                  builder: (controller) {
                    return Positioned(
                      bottom: 0,
                      right: 25,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "\$${controller.totalItem}",
                          style: const TextStyle(
                              fontFamily: Font.fontBold, fontSize: 18),
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
          )
    );
  }

  Widget buttonClick({required bool add, required VoidCallback onTap}) {
    return InkWell(
      splashColor: Colors.grey[200],
      borderRadius: const BorderRadius.all(Radius.circular(17)),
      onTap: () {
        onTap.call();
      },
      child: Ink(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: Border.all(color: ColorApp.borderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: add
              ? SvgPicture.asset("assets/icons/+add.svg")
              : SvgPicture.asset("assets/icons/-cart.svg"),
        ),
      ),
    );
  }
}
