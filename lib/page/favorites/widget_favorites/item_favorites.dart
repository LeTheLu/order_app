import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/utils/text_styte.dart';

class ItemFavorite extends StatelessWidget {
  const ItemFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  color: Colors.teal,
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  width: 241,
                  height: 60,
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
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    const Text("\$4.99", style: TextStyle(
                        fontFamily: Font.fontBold,
                        fontSize: 18
                    ),),
                    const SizedBox(width: 16,),
                    InkWell(
                      onTap: (){},
                      child: const Icon(Icons.arrow_forward_ios, size: 15,),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}