import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../colors.dart';

Widget textFieldGmailOrPass(BuildContext context,{required String title, bool? checkPass}){
  return SizedBox(
    height: 79,
    width: MediaQuery.of(context).size.width -40,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: ColorApp.greyColor),),
        Stack(
          children: [
            TextField(
              obscureText: checkPass ?? false,
              decoration: const InputDecoration(
              ),
            ),
            Visibility(
              visible: checkPass?? false,
                child: Positioned(
                  right: 10,
                  child: SvgPicture.asset("assets/icons/hinePass.svg"),
                ))
          ],
        )],
    ),
  );
}