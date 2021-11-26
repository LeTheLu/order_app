import 'package:flutter/material.dart';

import '../../colors.dart';

Widget buttonBig({required String nameButton,Color? color, Image? imageIcon, double? fontSize, double? withButton,VoidCallback? onTap}){
  return GestureDetector(
    onTap: (){
      onTap!.call();
    },
    child: Container(
        alignment: Alignment.center,
        height: 67,
        width: withButton ?? 353,
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
            Text(nameButton, style: TextStyle(fontFamily: "GilroyLight",fontSize: fontSize ?? 24, color: Colors.white, fontWeight: FontWeight.w600),),
          ],
        )
    ),
  );
}