import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';

class LoginController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController  = TextEditingController();

  bool checkLoginErr = false;
  bool checkPasswordHind = true;

  Future login() async {
    auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text)
        .then((value) => Get.toNamed(Routes.HOME_SCREEN)).catchError((e){
      Get.defaultDialog(

          title: "Đăng nhập không thành công",
          titleStyle: const TextStyle(color: Colors.white),
          backgroundColor: ColorApp.themeColor,
          middleText: "Hãy thử đăng nhập lại",
        middleTextStyle: const TextStyle(color: Colors.white)
      );
      update();
    });
  }

  void passwordHind(){
    checkPasswordHind = !checkPasswordHind;
    update();
  }

}