import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/colors.dart';

Widget cardItem({required String image, required String title,required String price, required String properties}){
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Container(
      height: 248.51,
      width: 173.32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(
          color: ColorApp.greyColor,
          width: 1
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            height: 80,
            width: 120,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                    child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) =>
              const Text('Some errors occurred!'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(title, style: const TextStyle(color: Colors.black , fontFamily: "GilroyBold",fontSize: 16,),),
            Text(title, style: TextStyle(color: ColorApp.greyColor , fontFamily: "GilroyBold",fontSize: 14,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(price,  style: const  TextStyle(color: Colors.black , fontFamily: "GilroyBold",fontSize: 18,)),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset("assets/icons/+.svg"),
                )
              ],
            ),
          ],),)
        ],
      ),
    ),
  );
}
