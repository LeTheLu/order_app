import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/widgets/button/button.dart';
import 'package:order_app/widgets/text_field/text_field_email_or_pass.dart';

import '../utils/colors.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Center(
                                  child: SvgPicture.asset("assets/icons/logoColor.svg"))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Sign Up",style: TextStyle(fontFamily: "GilroyBold",fontSize: 26),),
                              const SizedBox(height: 10,),
                              Text("Enter your credentials to continue",style: TextStyle(fontFamily: "GilroyLight",fontSize: 16,color: ColorApp.greyColor, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 20,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          textFieldGmailOrPass(context,title: "Username"),
                          textFieldGmailOrPass(context,title: "Gmail"),
                          textFieldGmailOrPass(context,title: "Password",checkPass: true),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("By continuing you agree to our ",style: TextStyle(color: ColorApp.greyColor , fontFamily: "GilroyLight",fontSize: 14,)),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Text("Terms of Service",style: TextStyle(color: ColorApp.themeColor , fontFamily: "GilroyLight",fontSize: 14,)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("and ",style: TextStyle(color: ColorApp.greyColor , fontFamily: "GilroyLight",fontSize: 14,)),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Text("Privacy Policy", style: TextStyle(color: ColorApp.themeColor , fontFamily: "GilroyLight",fontSize: 14,),),
                                  )
                                ],
                              ),
                            ],
                          )

                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30,),
                          Button(nameButton: "Sing Up",fontSize: 18, onTap: (){
                            Get.offAllNamed(Routes.HOME_SCREEN);
                          },),
                          const SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              const SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Text("Login", style: TextStyle(color: ColorApp.themeColor),),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
