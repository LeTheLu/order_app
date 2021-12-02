import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_app/routes/routes.dart';

class SingUpController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();

  String email = "";
  String password = "";
  String nameUser = "";


  Future<void> singUpGmailAndPass({required String email, required String password, required String nameUser }) async {

    auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      this.email = email;
      this.password = password;
      this.nameUser = nameUser;
      Map<String, String> user ={
        "email": emailTextController.text,
        "password" : passTextController.text,
        "nameUser" : nameTextController.text,
      };
      store.collection("users").doc().set(user).then((value) =>
          Get.offAllNamed(Routes.SELECT_LOCATION, arguments: email));
    })
        .catchError((e) {
          throw Exception(e);
    });
  }
}