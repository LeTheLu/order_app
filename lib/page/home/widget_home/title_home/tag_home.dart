import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

Widget tagHome({required String title, required String titleAction, required VoidCallback onTapAction}){
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 30.0, right: 24),
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