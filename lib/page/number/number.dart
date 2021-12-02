import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/singin_controller.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button_clip.dart';

class Number extends StatelessWidget {
  const Number({Key? key}) : super(key: key);


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
                            GetBuilder<SingInController>(
                              builder: (SingInController _controller) =>  Expanded(
                                  child: TextField(
                                    controller: _controller.textEditingController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "",
                                    ),
                                  )),
                            )
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
                  child: GetBuilder<SingInController>(
                    builder: (SingInController _controller) {
                      return buttonCircle(onPressed: (){
                        if(_controller.textEditingController.text.length == 10){
                          Get.toNamed(Routes.VETIFICATION);
                          _controller.signInWithPhone(numberPhone: _controller.textEditingController.text.substring(1));
                          print(_controller.textEditingController.text.substring(1));
                        }else {
                         print("Oh! số chưa đủ rồi");
                        }
                      });
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
