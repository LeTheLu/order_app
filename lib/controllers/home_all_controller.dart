import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_app/models/user.dart';

class HomeAllController extends GetxController {
  int page = 0;
  PageController? pageController;
  UserApp userApp = Get.arguments;

  @override
  void onInit() {
    pageController = PageController(initialPage: page);
    super.onInit();
  }

  void chang() {
    pageController = PageController(initialPage: page);
    update();
  }
}
