import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/models/user.dart';
import 'package:order_app/utils/colors.dart';

class FunctionFireBase {

  static HomeAllController homeAllController = Get.find();

  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static Future<Product> getProductById({required String idProduct}) async {
    DocumentSnapshot<Map<String, dynamic>> product;
    Product sanpham;

    product = await _firebaseFirestore
        .collection("product")
        .doc("sanpham")
        .collection("drinks")
        .doc(idProduct)
        .get();
    if (product.data() == null) {
      product = await _firebaseFirestore
          .collection("product")
          .doc("sanpham")
          .collection("foods")
          .doc(idProduct)
          .get();
      if (product.data() == null) {
        product = await _firebaseFirestore
            .collection("product")
            .doc("sanpham")
            .collection("fruits")
            .doc(idProduct)
            .get();
      }
    }

    sanpham = Product(
      id: idProduct,
      description: product.data()!["description"],
      price: product.data()!["price"],
      name: product.data()!["name"],
      img: product.data()!["img"],
      type: product.data()!["type"],
    );

    return sanpham;
  }

  static Future addProduct(
      {required String gmail, required String idProduct}) async {
    await _firebaseFirestore
        .collection("users")
        .where("email", isEqualTo: gmail)
        .get()
        .then((value) async {
      Map<String, dynamic> product = {idProduct: 1};
      await _firebaseFirestore
          .collection("users")
          .doc(value.docs.first.id)
          .collection("shopping")
          .doc("cart")
          .update(product)
          .then((value) => Get.snackbar(
              "Đã thêm sản phẩm vào giỏ hàng", "hãy kiểm tra giỏ hàng nhé",
              snackPosition: SnackPosition.BOTTOM,
              icon: const Icon(Icons.check),
              backgroundColor: ColorApp.themeColor.withOpacity(0.5))); //update(product);
    }).catchError((e) {
      Get.snackbar("Thêm sản phâm thất bại", "bạn hãy thử lại", icon: const Icon(Icons.clear), backgroundColor: Colors.red.withOpacity(0.5));
    });
  }

  static Future addFavorites({required String gmail, required String idProduct, required bool check}) async {
    await _firebaseFirestore
        .collection("users")
        .where("email", isEqualTo: gmail)
        .get()
        .then((value) async {
      Map<String, dynamic> product = {idProduct: check};
      await _firebaseFirestore
          .collection("users")
          .doc(value.docs.first.id)
          .collection("shopping")
          .doc("favorites")
          .update(product)
          .then((value) {
            if(check){
              Get.snackbar(
                  "Đã yêu thích sản phẩm", "hãy kiểm tra mục yêu thích nhé",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(Icons.check),
                  backgroundColor: ColorApp.themeColor.withOpacity(0.5));
            }
            else {
              Get.snackbar(
                  "Đã bỏ yêu thích sản phẩm", "hãy kiểm tra mục yêu thích nhé",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(Icons.check),
                  backgroundColor: Colors.red.withOpacity(0.5));
            }
      }); //update(product);
    }).catchError((e) {
      Get.snackbar("Like sản phẩm thất bại", "Bạn hãy thử lại", icon: const Icon(Icons.clear), backgroundColor: Colors.red.withOpacity(0.5));
    });
  }

  static Future getCountMyCart({required String idProduct}) async {
    int count = 0;
    await _firebaseFirestore.collection("users").doc(homeAllController.userApp.idUser).collection("shopping")
        .doc("cart").get().then((value) {
      count = value.data()![idProduct];
    });
    return count;
  }
  static Future<UserApp> getInfoUser({required String email}) async {
    UserApp userApp = UserApp();
    await _firebaseFirestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((value) {
      userApp = UserApp.fromJson(value.docs.first.data());
    }).catchError((e) {});
    return userApp;
  }
}
