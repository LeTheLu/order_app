import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/singin_controller.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button_clip.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
                  appBarTheme(context,iconLeading: const Icon(Icons.arrow_back_ios), onPressedLeading: (){}),
                  const SizedBox(height: 65.9,),
                  const Text("Enter your 4-digit code", style: TextStyle(fontSize: 26, fontFamily: "GilroyLight", fontWeight: FontWeight.bold),),
                  const SizedBox(height: 27.56,),
                  const Text("Code", style: TextStyle(fontSize: 16,fontFamily: "GilroyLight"),),
                  const SizedBox(height: 10.85,),
                  SizedBox(
                    width: 364,
                    height: 63,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        GetBuilder<SingInController>(
                            builder: (SingInController _controller) => TextField(
                              maxLength: 6,
                              controller: _controller.textEditingController01,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration.collapsed(hintText: " - - - - - -"),
                            ),),
                        const SizedBox(height: 15,),
                        const Expanded(
                          child: Divider(),)
                      ],
                    ),
                  ),

                ],
              ),
              GetBuilder(
                id: "button",
                  builder: (SingInController _controller) => Positioned(
                      bottom: 24.56,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap : (){

                              },
                              child: Text("Resend Code", style: TextStyle(fontSize: 18, color: ColorApp.themeColor, fontWeight: FontWeight.w300),),
                            ),

                            _controller.checkLoadingSMS ? CircularProgressIndicator(color: ColorApp.themeColor,) :buttonCircle(onPressed: (){
                              _controller.signInPhoneDoneSMS(sms: _controller.textEditingController01.text);
                            })
                          ],
                        ),
                      )),)
            ],
          ),
        ),
      ),
    );
  }
}
