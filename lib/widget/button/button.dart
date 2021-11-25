import 'package:flutter/material.dart';

import '../../colors.dart';

Widget buttonBig({required String nameButton,Color? color, Image? imageIcon}){
  return Container(
    alignment: Alignment.center,
    height: 67,
    width: 353,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(19),
    color: color ?? ColorApp.themeColor
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: imageIcon == null ? false : true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: imageIcon,
          ),),
        Text(nameButton, style: const TextStyle(fontFamily: "GilroyLight",fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),),
      ],
    )
  );
}