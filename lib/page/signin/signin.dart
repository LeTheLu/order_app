import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/singin_controller.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/button/button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/background/signin.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get your groceries\n with nectar",
                    style: TextStyle(fontFamily: "GilroyBold", fontSize: 26),
                  ),
                  const SizedBox(
                    height: 31.46,
                  ),
                  SizedBox(
                    width: 364,
                    height: 39.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          highlightColor: Colors.white54,
                          onTap: () {
                            Get.toNamed(Routes.NUMBER);
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/logo/ensign.png"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "+880",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Expanded(
                          child: Divider(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<SingInController>(
                    init: SingInController(),
                    builder: (SingInController _controller) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LOG_IN);
                          },
                          child: Text("Login with Email or SingIn",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorApp.themeColor,
                              )),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Or connect with social media",
                          style: TextStyle(fontSize: 14, color: Color(0xff828282)),
                        ),
                        const SizedBox(
                          height: 37.8,
                        ),
                        Button(
                          onTap: () {
                            _controller.signInWithGoogle();
                          },
                          nameButton: "Continue with Google",
                          imageIcon: Image.asset("assets/icons/google.png"),
                          color: const Color(0xFF5383EC),
                          fontSize: 18,
                        ),
                        const SizedBox(height: 20),
                        Button(
                            nameButton: "Continue with Facebook",
                            imageIcon: Image.asset("assets/icons/facebook.png"),
                            color: const Color(0xFF4A66AC),
                            fontSize: 18),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
