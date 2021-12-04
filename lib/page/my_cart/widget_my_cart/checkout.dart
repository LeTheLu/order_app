import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/utils/text_styte.dart';
import 'package:order_app/widgets/button/button.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xffF2F3F2),
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Checkout", style: TextStyle(fontSize: 24, fontFamily: Font.fontLight, fontWeight: FontWeight.w600),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.clear),
                    )
                  ],

                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemCheckout(title: "Delivery", actionTitle: "Select Method"),
                    itemCheckout(title: "Pament", actionTitle: ""),
                    itemCheckout(title: "Promo Code", actionTitle: "Pick discount"),
                    itemCheckout(title: "Total Cost", actionTitle: "\$13.97"),
                    const SizedBox(height: 20,),
                    const Text("By placing an order you agree to our",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),),
                     RichText(
                      text: const TextSpan(
                        text: 'Terms ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'And', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: 'Conditions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 26.0),
                      child: Button(nameButton: "Place Order",fontSize: 18,),
                    )
                  ],
                ),)
            ],
          ),
        )
      ],
    );
  }

  Widget itemCheckout({required String title,required String actionTitle}){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: ColorApp.greyColor, fontSize: 18)),
              Row(
                children: [
                  actionTitle == "" ? SvgPicture.asset("assets/icons/card.svg") :Text(actionTitle,style: TextStyle(fontSize: 16)),
                  const Icon(Icons.arrow_forward_ios, size: 15,)
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
