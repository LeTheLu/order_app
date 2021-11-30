import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/widgets/app_bar.dart';
import 'package:order_app/widgets/button/button_clip.dart';
import 'package:flutter/services.dart';

class Number extends StatefulWidget {
  const Number({Key? key}) : super(key: key);

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBarTheme(context,iconLeading: const Icon(Icons.arrow_back_ios), onPressedLeading: (){
                    Get.back();
                  }),
                  const SizedBox(height: 65.9,),
                  const Text("Enter your mobile number", style: TextStyle(fontSize: 26, fontFamily: "GilroyBold"),),
                  const SizedBox(height: 27.56,),
                  const Text("Mobile Number", style: TextStyle(fontSize: 16, fontFamily: "GilroyLight"),),
                  const SizedBox(height: 10.85,),
                  SizedBox(
                    width: 364,
                    height: 63,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:[
                            Image.asset("assets/logo/ensign.png"),
                            const SizedBox(width: 10,),
                            const Text("+880", style: TextStyle(fontSize: 18),),
                            const SizedBox(width: 20,),
                            const Expanded(child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                hintText: "",
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(height: 15,),
                        const Expanded(
                          child: Divider(),)
                      ],
                    ),
                  ),

                ],
              ),
              Positioned(
                  bottom: 24.56,
                  right: 24.56,
                  child: buttonCircle(onPressed: (){
                    Get.toNamed(Routes.VETIFICATION);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
