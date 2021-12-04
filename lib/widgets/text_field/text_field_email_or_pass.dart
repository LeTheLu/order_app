import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/login_controller.dart';
import '../../utils/colors.dart';

Widget textFieldGmailOrPass(BuildContext context,{required String title, bool? checkPass, TextEditingController? controller}){
  return GetBuilder<LoginController>(
    init: LoginController(),
      builder: (LoginController _loginController) => SizedBox(
        height: 79,
        width: MediaQuery.of(context).size.width -40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: ColorApp.greyColor),),
            Stack(
              children: [
                TextField(
                  controller: controller,
                  obscureText: checkPass == true ? _loginController.checkPasswordHind : false ,
                  decoration: const InputDecoration(
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Visibility(
                      visible: checkPass?? false,
                      child: GestureDetector(
                        onTap: (){
                          _loginController.passwordHind();
                        },
                        child: _loginController.checkPasswordHind ? Text("Show"): Text("Hind"),
                      )),
                )
              ],
            )],
        ),
      ),);
}