import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_controller.dart';
import 'package:order_app/page/home/widget_home/list_view/list_item.dart';
import 'package:order_app/page/home/widget_home/list_view/list_menu_horizontal.dart';
import 'package:order_app/widgets/bottom_appbar/bottom_appbar.dart';
import 'package:order_app/page/home/widget_home/title_home/tag_home.dart';
import 'package:order_app/widgets/button/button.dart';
import 'package:order_app/widgets/text_field/search.dart';

import '../../utils/colors.dart';

class HomeSrc extends StatefulWidget {
  const HomeSrc({Key? key}) : super(key: key);

  @override
  _HomeSrcState createState() => _HomeSrcState();
}

class _HomeSrcState extends State<HomeSrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 31,
                        width: 26.6,
                        child: SvgPicture.asset("assets/icons/logoColor.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset("assets/icons/addLocation.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Dhaka, Banassre",
                                style: TextStyle(
                                    fontFamily: "GilroyLight",
                                    fontSize: 18,
                                    color: ColorApp.greyColor,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      search(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Image.asset("assets/background/banner.png"),
                      ),
                    ],
                  ),
                ),
                tagHome(
                    title: "Exclusive Offer",
                    titleAction: "See all",
                    onTapAction: () {}),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) => controller.dataExclusiveOffer.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListItem(
                          listProduct: controller.dataExclusiveOffer,
                        ),
                ),
                tagHome(
                    title: "Best Selling",
                    titleAction: "See all",
                    onTapAction: () {}),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) => controller.dataBestSelling.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListItem(
                          listProduct: controller.dataBestSelling,
                        ),
                ),
                tagHome(
                    title: "Groceries",
                    titleAction: "See all",
                    onTapAction: () {}),
                const ListMenuHorizontal(),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) => controller.dataGroceries.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListItem(
                          listProduct: controller.dataGroceries,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppbar(),
    );
  }
}
