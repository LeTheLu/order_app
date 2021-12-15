import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/utils/colors.dart';

import 'home_all_controller.dart';

class FavoritesController extends GetxController{
  HomeAllController homeAllController = Get.find();
  MyCartController myCartController = Get.find();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late QuerySnapshot<Map<String, dynamic>> initDataFavorite;

  List<String> listIdItemFavorite = [];
  List<Product> listDataFavorites = [];

  Stream<List<Product>> getDataTest() async* {
    yield listDataFavorites;
  }

  Future<List<Product>>  initData() async {
    List<Product> listTest = [];
    await Future.forEach(listIdItemFavorite, (element) async {
      Product product = await FunctionFireBase.getProductById(
          idProduct: element.toString());
      listTest.add(product);
    });
    return listTest;
  }

  addAllToCart() async {
    List<Product> data = [];
    data.addAll(listDataFavorites);
    for (var elementC in myCartController.listDataCart) {
      for (var elementFA in listDataFavorites) {
        if(elementC.id == elementFA.id){
          data.removeWhere((element) => element.id == elementC.id);
        }
      }
    }
    if(data.isEmpty){
      Get.snackbar(
          "Tất cả sản phẩm đã được thêm vào giỏ hàng", "hãy kiểm tra giỏ hàng nhé",
          icon: const Icon(Icons.check),
          backgroundColor: Colors.red.withOpacity(0.5));
    }
    myCartController.listDataCart.addAll(data);
    for (var element in data) {
      myCartController.listIdItemCart.add(element.id);
    }
    Get.snackbar(
        "Đã thêm vào giỏ hàng", "hãy kiểm tra giỏ hàng nhé",
        icon: const Icon(Icons.check),
        backgroundColor: ColorApp.themeColor.withOpacity(0.5));
    myCartController.getTotal();
    myCartController.update(["total"]);

    for (Product element in data) {
      await FirebaseFirestore.instance.collection("users").doc(homeAllController.userApp.idUser)
          .collection("shopping").doc("cart").collection("items").doc(element.id).set({"soluong" : 1});
    }
  }

  @override
  void onInit() async {
    initDataFavorite = homeAllController.initDataFavorite;
    for (var element in initDataFavorite.docs) {
      listIdItemFavorite.add(element.id);
    }
    listDataFavorites = await initData();
    update();
    super.onInit();
  }
}