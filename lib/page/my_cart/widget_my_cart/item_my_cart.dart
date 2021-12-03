import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/utils/text_styte.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  width: 241,
                  height: 104,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title",style: TextStyle(fontSize: 16, fontFamily: Font.fontBold),),
                          const SizedBox(height: 5,),
                          Text("Title",style: TextStyle(fontSize: 14, fontFamily: Font.fontLight),),
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              buttonClick(add: false,onTap: (){}),
                              const SizedBox(width: 17.45,),
                              Text("1"),
                              const SizedBox(width: 17.45,),
                              buttonClick(add: true, onTap: (){}),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
            Positioned(
              top: 0,
              right: 25,
              child: InkWell(
                onTap: (){},
                child: Icon(Icons.clear, color: ColorApp.greyColor,),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 25,
              child: InkWell(
                onTap: (){},
                child: Text("\$4.99", style: TextStyle(
                  fontFamily: Font.fontBold,
                  fontSize: 18
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buttonClick({required bool add, required VoidCallback onTap}){
    return InkWell(
      splashColor: Colors.grey[200],
      borderRadius: const BorderRadius.all(Radius.circular(17)),
      onTap: (){
        onTap.call();
      },
      child: Ink(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: Border.all(
            color: ColorApp.borderColor,
            width: 1
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: add ? SvgPicture.asset("assets/icons/+add.svg") : SvgPicture.asset("assets/icons/-cart.svg"),
        ),
      ),
    );
  }
}
