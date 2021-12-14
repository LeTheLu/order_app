import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/user.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/colors.dart';

class LoginController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController  = TextEditingController();

  bool checkLoginErr = false;
  bool checkPasswordHind = true;
  late QuerySnapshot<Map<String, dynamic>> initDataMyCart;
  late QuerySnapshot<Map<String, dynamic>> initDataFavorite;

  Future login() async {
    auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text)
        .then((value) async {
          UserApp userApp = await FunctionFireBase.getInfoUser(email: emailController.text);
          await dataStart(idUser: userApp.idUser??"");
          Get.offAllNamed(Routes.HOMEALL,arguments: {"userApp" : userApp , "initDataMyCart" : initDataMyCart, "initDataFavorite" : initDataFavorite});
    }).catchError((e){
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

  dataStart({required String idUser}) async {
    initDataMyCart = await FirebaseFirestore.instance.collection('users').doc(idUser).collection("shopping").doc("cart").collection("items").get();
    initDataFavorite = await FirebaseFirestore.instance.collection('users').doc(idUser).collection("shopping").doc("favorites").collection("items").get();
  }

  void passwordHind(){
    checkPasswordHind = !checkPasswordHind;
    update();
  }
@override
  void onInit() {
  emailController.text = "lethelu@gmail.com";
  passController.text = "lethelu123";
    super.onInit();
  }
}