import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';

Widget cardItem({required Product product,required String idProduct, double? rightVetical }){
  return Padding(
    padding: EdgeInsets.only(right: rightVetical ?? 15),
    child: GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => InkWell(
        onTap: (){
          Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
        },
        child: Container(
          height: 248.51,
          width: 173.32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(
                color: const Color(0xFFE2E2E2),
                width: 1
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                height: 80,
                width: 120,
                child: Image.network(
                  product.img[0],
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                        child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) =>
                  const Text('Some errors occurred!'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: const TextStyle(color: Colors.black , fontFamily: "GilroyBold",fontSize: 16,),),
                    Text(product.type , style: TextStyle(color: ColorApp.greyColor , fontFamily: "GilroyBold",fontSize: 14,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(product.price,  style: const  TextStyle(color: Colors.black , fontFamily: "GilroyBold",fontSize: 18,)),
                        GestureDetector(
                          onTap: (){
                            FunctionFireBase.addProduct(gmail: controller.homeAllController.userApp.email ?? "", idProduct: idProduct);
                          },
                          child: SvgPicture.asset("assets/icons/+.svg"),
                        )
                      ],
                    ),
                  ],),)
            ],
          ),
        ),
      ),

    ),
  );
}
