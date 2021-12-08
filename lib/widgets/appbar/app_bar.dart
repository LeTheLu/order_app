import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBarTheme(
  BuildContext context, {
  Icon? iconLeading,
  String? title,
  SvgPicture? iconAction,
  VoidCallback? onPressedAction,
  VoidCallback? onPressedLeading,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: iconLeading == null ? false : true,
          child: Container(
            margin: const EdgeInsets.only(left: 10),
          height: 40,
          width: 40,
          child: InkWell(
            highlightColor: Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            onTap: () {
              onPressedLeading!.call();
            },
            child: Center(child: iconLeading,),
            ),
        ),),
        Visibility(
          visible: title == null ? false: true,
            child: Text(title ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)),
        Visibility(
          visible: iconAction == null ? false : true,
          child: Container(
            margin: const EdgeInsets.only(right: 25),
          height: 20,
          width: 20,
          child: GestureDetector(
            onTap: () {
              onPressedAction!.call();
            },
            child: iconAction,
          ),
        ),)
      ],
    ),
  );
}
