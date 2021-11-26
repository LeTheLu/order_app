import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_app/widget/card/card.dart';
import 'package:order_app/widget/menu_home/menu_home.dart';
import 'package:order_app/widget/text_field/search.dart';

import '../colors.dart';

class HomeSrc extends StatefulWidget {
  const HomeSrc({Key? key}) : super(key: key);

  @override
  _HomeSrcState createState() => _HomeSrcState();
}

class _HomeSrcState extends State<HomeSrc> {
  String urlImg = "https://lh3.googleusercontent.com/proxy/S9RMNkokhSrg5eo_fl7uJ_qBIE7o1I1W_U6aekU_Slkfn2vLgz80DBof8zXqQl5r0mbe8hB7syn-NYVSFMjhNDwYjnXGXVa1_oTebSo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(height: 30,),
                      SvgPicture.asset("assets/icons/addLocation.svg"),
                      const SizedBox(width: 10,),
                      Text("Dhaka, Banassre",style: TextStyle(fontFamily: "GilroyLight",fontSize: 18,color: ColorApp.greyColor, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                search(),
                const SizedBox(height: 20,),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  child: Image.asset("assets/background/banner.png"),
                ),
                menuHome(title: "Exclusive Offer",titleAction: "See all", onTapAction: (){}),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => cardItem(
                        title: "banana" ,
                        image: urlImg,
                        price: "100",
                        properties: "200" ),),
                ),
                menuHome(title: "Best Selling",titleAction: "See all", onTapAction: (){}),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => cardItem(
                        title: "banana" ,
                        image: urlImg,
                        price: "100",
                        properties: "200" ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
