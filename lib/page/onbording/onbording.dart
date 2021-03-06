import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/page/signin/signin.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/button/button.dart';

class Onbording extends StatelessWidget {
  const Onbording({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/onbording_backgroud.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/logo/logo01.svg"),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset("assets/text/welcome_to_our_store.svg"),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                    "assets/text/ger_your_groceries_in_as_fast_as_one_hour.svg"),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    nameButton: "Get Started",
                    onTap: () {
                      Get.toNamed(Routes.SINGIN);
                    },
                    color: ColorApp.themeColor,
                    fontSize: 18),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
