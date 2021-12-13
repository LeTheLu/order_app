import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';


class MyCartController extends GetxController {
  final HomeAllController homeAllController = Get.find();
  late Stream<
      DocumentSnapshot<Map<String, dynamic>>> streamCart = FirebaseFirestore
      .instance.collection('users').doc(homeAllController.userApp.idUser)
      .collection("shopping").doc("cart")
      .snapshots();

  List<String> listCart = [];
  double total = 0.0;

  Future<Product> getItemDataProduct({required String idProduct}) async {
    Product product = await FunctionFireBase.getProductById(
        idProduct: idProduct);
    return product;
  }
}
