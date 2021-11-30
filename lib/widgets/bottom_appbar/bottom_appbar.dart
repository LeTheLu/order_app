import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
              /*spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)*/
          )
        ],
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      child: BottomNavigationBar(
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.teal,
                icon: SvgPicture.asset("assets/icons/shop.svg", color: Colors.black,),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/explore.svg"),
                backgroundColor: Colors.teal,
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/cart.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/favourite.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/account.svg"),
                label: "")
          ]),
    );
  }
}
