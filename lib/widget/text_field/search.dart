import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../colors.dart';

Widget search(){
  return Container(
    width : 364,
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
        Expanded(child: TextField(
          decoration: InputDecoration.collapsed(
              hintText: "Search Store",
            hintStyle: TextStyle(fontFamily: "GilroyLight",fontSize: 14,color: ColorApp.greyColor, fontWeight: FontWeight.w600))
          ),
        ),
      ],
    ),
  );
}