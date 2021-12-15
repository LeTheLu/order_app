import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';

class ButtonAccount extends StatelessWidget {
  final VoidCallback tap;


  const ButtonAccount({Key? key, required this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 67,
      width:  353,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xffF2F3F2)
      ),
      child: InkWell(
        onTap: (){
          tap.call();
        },
        child: Stack(
          alignment: Alignment.center,
            children: [
            Text("Log Out", style: TextStyle(fontFamily: "GilroyLight",fontSize: 18, color: ColorApp.themeColor, fontWeight: FontWeight.w600),),
              Positioned(
                left: 25,
                child: SvgPicture.asset("assets/icons/logout.svg"),)
            ],
    ),
      ));
  }
}
