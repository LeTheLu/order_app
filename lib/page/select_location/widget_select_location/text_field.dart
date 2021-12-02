import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/select_location_controller.dart';

import '../../../utils/colors.dart';

var list = ['Apple', 'Banana', 'Mango', 'Orange'];

Widget textFieldZone(BuildContext context, {required String title}) {
  return GetBuilder<SelectLocationController>(
    init: SelectLocationController(),
    builder: (controller) => SizedBox(
      height: 79,
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: ColorApp.greyColor),
          ),
          Stack(
            children: [
              Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return list.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  if(title == "Your Zone"){
                    controller.zone = selection;
                  }else {
                    controller.area = selection;
                  }
                },
              ),
              Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icons/v.svg")),
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
