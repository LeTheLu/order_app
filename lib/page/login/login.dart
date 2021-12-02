import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/login_controller.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/button/button.dart';
import 'package:order_app/widgets/text_field/text_field_email_or_pass.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) =>  SizedBox(
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
                                    child: SvgPicture.asset(
                                        "assets/icons/logoColor.svg"))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Loging",
                                  style: TextStyle(
                                      fontFamily: "GilroyBold", fontSize: 26),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Enter your emails and password",
                                    style: TextStyle(
                                        fontFamily: "GilroyLight",
                                        fontSize: 16,
                                        color: ColorApp.greyColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: GetBuilder<LoginController>(
                          init: LoginController(),
                          builder: (controller) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              textFieldGmailOrPass(context, title: "Gmail", controller: controller.emailController),
                              textFieldGmailOrPass(context,
                                  title: "Password", checkPass: true,controller: controller.passController),
                              GestureDetector(
                                onTap: () {},
                                child: const Text("Forgot Password?"),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) => Button(
                                nameButton: "Login",
                                fontSize: 18,
                                onTap: () {
                                  controller.login();
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don’t have an account?"),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SIGN_UP);
                                },
                                child: Text(
                                  "Singup",
                                  style: TextStyle(color: ColorApp.themeColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}
