import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_app/models/user.dart';

class HomeAllController extends GetxController{
    String email = Get.arguments;
    int page = 0;
    PageController? pageController;
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    UserApp? userApp;

    Future getInfoUser()async{
      await _firebaseFirestore.collection("users").where("email", isEqualTo: email).get()
          .then((value) {
        userApp = UserApp.fromJson(value.docs.first.data());
        update();
      }).catchError((e){});
    }

@override
  void onInit() {
    pageController = PageController(initialPage: page);
    getInfoUser();
    super.onInit();
  }
  void chang(){
    pageController = PageController(initialPage: page);
    update();
  }
}