import 'package:flutter/material.dart';

import '../../colors.dart';

Widget menuHome({required String title, required String titleAction, required VoidCallback onTapAction}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontFamily: "GilroyLight",fontSize: 24,color: Colors.black, fontWeight: FontWeight.w600),),
        GestureDetector(
          onTap: (){
            onTapAction.call();
          },
          child: Text(titleAction, style: TextStyle(fontFamily: "GilroyLight",fontSize: 16,color: ColorApp.themeColor),),
        )
      ],
    ),
  );
}