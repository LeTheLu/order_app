import 'package:flutter/material.dart';

Widget appBarTheme(
  BuildContext context, {
  Icon? iconLeading,
  String? title,
  Icon? iconAction,
  VoidCallback? onPressedAction,
  VoidCallback? onPressedLeading,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    color: Colors.transparent,
    width: MediaQuery.of(context).size.width,
    height: 70,
    child: Row(
      children: [
        Visibility(
          visible: iconLeading == null ? false : true,
          child: SizedBox(
          height: 40,
          width: 40,
          child: GestureDetector(
            onTap: () {
              onPressedLeading!.call();
            },
            child: iconLeading,
          ),
        ),),
        Visibility(
          visible: title == null ? false: true,
            child: Text(title ?? "")),
        Visibility(
          visible: iconAction == null ? false : true,
          child: SizedBox(
          height: 40,
          width: 40,
          child: GestureDetector(
            onTap: () {
              onPressedAction!.call();
            },
            child: iconLeading,
          ),
        ),)
      ],
    ),
  );
}
