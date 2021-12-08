import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/find_products_controller.dart';

import '../../utils/colors.dart';

Widget search({TextEditingController? textEditingController, VoidCallback? onEditingComplete}){
  return Container(
    width : double.infinity,
    height: 51.57,
    decoration: const BoxDecoration(
      color: Color(0xFFF2F3F2),
      borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 18,
            width: 18,
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ),
        Expanded(child: GetBuilder<FindProductsController>(
          init: FindProductsController(),
          builder: (FindProductsController _controller) {
            return TextField(
              controller: _controller.textEditingController,
              textInputAction: TextInputAction.search,
              onEditingComplete: (){
                onEditingComplete!.call();
              },
              decoration: InputDecoration.collapsed(
                  hintText: "Search Store",
                hintStyle: TextStyle(fontFamily: "GilroyLight",fontSize: 14,color: ColorApp.greyColor, fontWeight: FontWeight.w600))
              );
          }
        ),
        ),
      ],
    ),
  );
}