import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/text_styte.dart';
import 'package:order_app/widgets/button/button.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeAllController homeAllController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(flex: 1,
                    child: Image.asset("assets/background/oderdone.png")),
                Expanded(flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          width: 300,
                          child: Column(
                            children: const [
                              Text("Your Order has been accepted", overflow: TextOverflow.clip,style: TextStyle(fontSize: 28,fontFamily: Font.fontLight, fontWeight: FontWeight.w600 ),textAlign: TextAlign.center,),
                              SizedBox(height: 20,),
                              Text("Your items has been placcd and is on it’s way to being processed", overflow: TextOverflow.clip,style: TextStyle(fontSize: 16,fontFamily: Font.fontLight, color: Colors.grey ),textAlign: TextAlign.center,),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Positioned(
              bottom: 62,
                child: Column(
                  children: [
                    Button(nameButton: "Track Order", fontSize: 18,onTap: (){},),
                    const SizedBox(height: 24,),
                    InkWell(
                      onTap: (){
                        //Get.toNamed(Routes.HOMEALL,arguments: {"userApp" : homeAllController.userApp , "initDataMyCart" : homeAllController.initDataMyCart, "initDataFavorite" : homeAllController.initDataFavorite});
                      },
                      child: const Text("Back to home", style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: Font.fontLight, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
