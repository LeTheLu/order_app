import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/utils/colors.dart';

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAllController>(
      init: HomeAllController(),
      builder: (HomeAllController _homeAllController) {
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
              )
            ],
            borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: _homeAllController.page,
              onTap: (index) {
                _homeAllController.page = index;
                _homeAllController.pageController!.animateToPage(index,
                    duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                _homeAllController.update();

              },
              selectedItemColor: ColorApp.themeColor,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/icons/shop.svg", color: ColorApp.themeColor,),
                    icon: SvgPicture.asset("assets/icons/shop.svg", color: Colors.black,),
                    label: ""),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset("assets/icons/explore.svg", color: ColorApp.themeColor,),
                    icon: SvgPicture.asset("assets/icons/explore.svg"),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/icons/cart.svg", color: ColorApp.themeColor,),
                    icon: SvgPicture.asset("assets/icons/cart.svg"),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/icons/favourite.svg", color: ColorApp.themeColor,),
                    icon: SvgPicture.asset("assets/icons/favourite.svg"),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("assets/icons/account.svg", color: ColorApp.themeColor,),
                    icon: SvgPicture.asset("assets/icons/account.svg"),
                    label: "")
              ]),
        );
      }
    );
  }
}
