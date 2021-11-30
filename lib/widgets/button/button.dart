import 'package:flutter/material.dart';
import 'package:order_app/utils/colors.dart';

class Button extends StatelessWidget{
  final  Function? onTap;
  final Widget? imageIcon;
  final String? nameButton;
  final double? widthButton;
  final Color? color;
  final double? fontSize;
  const Button({Key? key, this.onTap, this.imageIcon, this.nameButton, this.widthButton, this.color, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.grey,
        borderRadius: BorderRadius.circular(19),
        onTap: (){
          onTap!.call();
        },
        child: Ink(
          height: 67,
          width: widthButton ?? 353,
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
              Text(nameButton!, style: TextStyle(fontFamily: "GilroyLight",fontSize: fontSize ?? 24, color: Colors.white, fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }

}