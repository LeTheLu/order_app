import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';

import 'home_all_controller.dart';

class FavoritesController extends GetxController{
  HomeAllController homeAllController = Get.find();
  late Stream<DocumentSnapshot<Map<String, dynamic>>> streamFavorites = FirebaseFirestore
      .instance.collection('users').doc(homeAllController.userApp.idUser)
      .collection("shopping").doc("favorites")
      .snapshots();
  List<String> listFavorite = [];
  List<Product> listDataProductFavorites = [];

  Future<Product> getItemDataFavorites({required String idProduct}) async {
    Product product = await FunctionFireBase.getProductById(
        idProduct: idProduct);
    return product;
  }

}