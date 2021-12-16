import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/page/account/widget_button/button_accout.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/text_styte.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeAllController homeAllController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
            child: Row(
              children: [
                Container(
                  height: 64,
                  width: 65,
                  color: Colors.pinkAccent,
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(homeAllController.userApp.nameUser ?? "User"),
                        InkWell(
                          child: SvgPicture.asset("assets/icons/pend.svg"),
                        )
                      ],
                    ),
                    Text(homeAllController.userApp.email ?? "abc@gmail.com")
                  ],
                )
              ],
            ),),
            const Divider(),
            itemAccount(title: "Orders", icon: SvgPicture.asset("assets/icons/Orders icon.svg")),
            itemAccount(title: "My Details", icon: SvgPicture.asset("assets/icons/My Details icon.svg")),
            itemAccount(title: "Delivery Address", icon: SvgPicture.asset("assets/icons/Delicery address.svg")),
            itemAccount(title: "Payment Methods", icon: SvgPicture.asset("assets/icons/Vector icon.svg")),
            itemAccount(title: "Promo Cord", icon: SvgPicture.asset("assets/icons/Promo Cord icon.svg")),
            itemAccount(title: "Notifecations", icon: SvgPicture.asset("assets/icons/Bell icon.svg")),
            itemAccount(title: "Help", icon: SvgPicture.asset("assets/icons/help icon.svg")),
            itemAccount(title: "About", icon: SvgPicture.asset("assets/icons/Orders icon.svg")),
            ButtonAccount(tap: (){Get.offAllNamed(Routes.LOG_IN);})
          ],
        ),
      ),
    );
  }
  Widget itemAccount({required SvgPicture icon, required String title}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(width: 25,),
                    Text(title, style: TextStyle(fontSize: 18, fontFamily: Font.fontLight, fontWeight: FontWeight.w600),),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
