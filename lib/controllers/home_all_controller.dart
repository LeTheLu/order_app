import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_app/models/user.dart';

class HomeAllController extends GetxController {
  int page = 0;
  PageController? pageController;
  late UserApp userApp;
  late QuerySnapshot<Map<String, dynamic>> initDataMyCart ;
  late QuerySnapshot<Map<String, dynamic>> initDataFavorite ;

  @override
  void onInit() {
    userApp = Get.arguments["userApp"];
    initDataMyCart = Get.arguments["initDataMyCart"];
    initDataFavorite = Get.arguments["initDataFavorite"];
    pageController = PageController(initialPage: page);
    super.onInit();
  }

  void chang() {
    pageController = PageController(initialPage: page);
    update();
  }
}
