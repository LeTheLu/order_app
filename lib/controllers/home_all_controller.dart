import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeAllController extends GetxController{
    int page = 0;
    PageController? pageController;

@override
  void onInit() {
    pageController = PageController(initialPage: page);
    super.onInit();
  }
  void chang(){
    pageController = PageController(initialPage: page);
    update();
  }
}