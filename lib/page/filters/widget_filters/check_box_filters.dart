import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/utils/text_styte.dart';

class CheckBoxFilters extends StatefulWidget {
  final String title;

  const CheckBoxFilters({Key? key, required this.title}) : super(key: key);

  @override
  State<CheckBoxFilters> createState() => _CheckBoxFiltersState();
}

class _CheckBoxFiltersState extends State<CheckBoxFilters> {

  bool boolChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          boolChecked =!boolChecked;
        });
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            boolChecked ? checked(): unCheck(),
            const SizedBox(width: 12,),
            Text(widget.title, style: TextStyle(fontSize: 16, color: boolChecked ? ColorApp.themeColor : Colors.black, fontWeight: FontWeight.w600, fontFamily: Font.fontLight),),
          ],
        ),
      ),
    );
  }

  Widget checked(){
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: ColorApp.themeColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset("assets/icons/check.svg"),
      ),
    );
  }

  Widget unCheck(){
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: ColorApp.greyColor,
          width: 2
        )
      ),
    );
  }
}
