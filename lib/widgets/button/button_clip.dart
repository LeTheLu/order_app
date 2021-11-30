import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/utils/colors.dart';

Widget buttonCircle({VoidCallback? onPressed}) {
  return Ink(
      height: 67,
      width: 67,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: ColorApp.themeColor,
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            highlightColor: Colors.grey,
            onTap: () {
              onPressed!.call();
            },
            child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
          )));
}
