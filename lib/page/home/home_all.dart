import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/page/account/account.dart';
import 'package:order_app/page/favorites/favorites.dart';
import 'package:order_app/page/find_products/find_products.dart';
import 'package:order_app/page/my_cart/my_cart.dart';
import 'package:order_app/widgets/bottom_appbar/bottom_appbar.dart';

import 'home_src.dart';

class HomeAll extends StatelessWidget {
  const HomeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAllController>(
      init: HomeAllController(),
      builder: (HomeAllController _controller) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller.pageController,
            onPageChanged: (value) {
              _controller.page = value;
              _controller.update();
            },
            children: const [
              HomeSrc(),
              FindProducts(),
              MyCart(),
              Favorites(),
              Account(),
            ],
          ),
            bottomNavigationBar: const BottomAppbar(),
        );
      }
    );
  }
}
