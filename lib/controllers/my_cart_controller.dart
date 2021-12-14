import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';


class MyCartController extends GetxController {
  final HomeAllController homeAllController = Get.find();
  late QuerySnapshot<Map<String, dynamic>> initDataMyCart ;

  List<String> listIdItemCart = [];
  List<Product> listDataCart = [];

  double total = 0.0;


  Stream<List<Product>> getDataTest() async* {
    yield listDataCart;
  }

  Future initData() async {
    List<Product> listTest = [];
    await Future.forEach(listIdItemCart, (element) async {
      Product product = await FunctionFireBase.getProductById(idProduct: element.toString());
      listTest.add(product);
    });
    listDataCart = listTest;
  }



  @override
  void onInit() async {
    initDataMyCart = homeAllController.initDataMyCart;
    for (var element in initDataMyCart.docs) {
      listIdItemCart.add(element.id);
    }
    await initData();
    super.onInit();
  }
}
