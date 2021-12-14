import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/favorites_controller.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/models/user.dart';
import 'package:order_app/utils/colors.dart';

class FunctionFireBase {
  static HomeAllController homeAllController = Get.find();
  static FavoritesController favoritesController = Get.find();
  static MyCartController myCartController = Get.find();
  static final  _firebaseFirestoreUser = FirebaseFirestore.instance.collection("users").doc(homeAllController.userApp.idUser).collection("shopping");
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

  static addMyCart({required Product product}) async {
    myCartController.listDataCart.add(product);
      Get.snackbar("Thêm sản phâm thành công", "bạn hãy kiểm tra GIỎ HÀNG nhé!",
          icon: const Icon(Icons.clear),
          backgroundColor: ColorApp.themeColor.withOpacity(0.5));
    _firebaseFirestoreUser.doc("cart").collection("items").doc(product.id).set({"soluong" : 1});
  }

  static Future addFavorites({required Product product, required bool check}) async {
    if (check) {
      favoritesController.listDataFavorites.add(product);
          Get.snackbar(
              "Đã yêu thích sản phẩm", "hãy kiểm tra mục yêu thích nhé",
              backgroundColor: ColorApp.themeColor.withOpacity(0.5),
              icon: const Icon(Icons.check));
      _firebaseFirestoreUser.doc("favorites").collection("items").doc(product.id).set({});
    } else {
      favoritesController.listDataFavorites.removeWhere((element) => element == product);
          Get.snackbar(
              "Đã bỏ yêu thích sản phẩm", "hãy kiểm tra mục yêu thích nhé",
              icon: const Icon(Icons.check),
              backgroundColor: Colors.red.withOpacity(0.5));
      _firebaseFirestoreUser.doc("favorites").collection("items").doc(product.id).delete();
    }
  }

  static Future getCountMyCart({required String idProduct}) async {
    int count = 0;
    await _firebaseFirestoreUser
        .doc("cart")
        .get()
        .then((value) {
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
