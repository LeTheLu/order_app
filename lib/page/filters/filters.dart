import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/page/filters/widget_filters/check_box_filters.dart';
import 'package:order_app/utils/text_styte.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button.dart';

class Filters extends StatelessWidget {
  const Filters ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBarTheme(context,iconLeading: const Icon(Icons.arrow_back_ios), title: "Filters", onPressedLeading: () => Get.back() ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        color: Color(0xFFF2F3F2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Categories", style: TextStyle(fontSize: 24, fontFamily: Font.fontBold, fontWeight: FontWeight.w300),),
                          CheckBoxFilters(title: "Eggs",),
                          CheckBoxFilters(title: "Noodles & Pasta",),
                          CheckBoxFilters(title: "Chips & Crisps",),
                          CheckBoxFilters(title: "Fast Food",),
                          SizedBox(height: 40,),
                          Text("Brand", style: TextStyle(fontSize: 24, fontFamily: Font.fontBold, fontWeight: FontWeight.w300),),
                          SizedBox(height: 20,),
                          CheckBoxFilters(title: "Individual Callection",),
                          CheckBoxFilters(title: "Cocola",),
                          CheckBoxFilters(title: "Ifad",),
                          CheckBoxFilters(title: "Kazi Farmas",),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 38,
                      child: Button(nameButton: "Apply Filter",fontSize: 18,onTap: (){},))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
