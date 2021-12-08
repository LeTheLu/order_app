import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  String idUser = "";


  Future<void> singUpGmailAndPass({required String email, required String password, required String nameUser }) async {

    await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      this.email = email;
      this.password = password;
      this.nameUser = nameUser;
      Map<String, String> user ={
        "email": emailTextController.text,
        "password" : passTextController.text,
        "nameUser" : nameTextController.text,
        "idUser" : idUser,
      };
      store.collection("users").doc().set(user).then((value) async {
        //Tìm User bằng gmail
        await store.collection("users").where("email", isEqualTo: email).get().then((value) async {
          // gán Id cho User
          Map<String, String> idUserMap = {
            "idUser" : value.docs.first.id,
          };
          await store.collection("users").doc(value.docs.first.id).update(idUserMap).then((val) async {
            Get.offAllNamed(Routes.SELECT_LOCATION, arguments: email);
          });
        });

      });
    }).catchError((e) {
          throw Exception(e);
    });
  }
}