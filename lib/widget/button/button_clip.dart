import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/colors.dart';

Widget buttonCircle({required VoidCallback onPressed}) {
  return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: 67,
            width: 67,
            color: ColorApp.themeColor,
            child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
          )));
}
