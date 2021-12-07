import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/search_controller.dart';
import 'package:order_app/utils/colors.dart';

class WidgetSearch extends StatelessWidget {


  const WidgetSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (SearchController _controller) {
          return Container(
            width : double.infinity,
            height: 51.57,
            decoration: const BoxDecoration(
                color: Color(0xFFF2F3F2),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
                Expanded(child: TextField(
                  textInputAction: TextInputAction.search,
                  onEditingComplete: (){
                    _controller.searchName();
                  },
                  controller: _controller.textEditingController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Search Store",
                        hintStyle: TextStyle(fontFamily: "GilroyLight",fontSize: 14,color: ColorApp.greyColor, fontWeight: FontWeight.w600))
                ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
