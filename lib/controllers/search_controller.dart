import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';

class SearchController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  bool checkSearchErr = false;
  List listSearch = [];
  List<Product> listProduct = [];

  Future searchName() async {
    listSearch = [];
    listProduct = [];
    update();
    await _store
        .collection("product")
        .doc("sanpham")
        .collection("drinks")
        .where("name", isGreaterThanOrEqualTo: textEditingController.text)
        .get()
        .then((value) async {
      listSearch.add(value.docs.first.id);
      await _store
          .collection("product")
          .doc("sanpham")
          .collection("foods")
          .where("name", isGreaterThanOrEqualTo: textEditingController.text)
          .get()
          .then((value)async {
        listSearch.add(value.docs.first.id);
        await _store
            .collection("product")
            .doc("sanpham")
            .collection("fruits")
            .where("name", isGreaterThanOrEqualTo: textEditingController.text)
            .get()
            .then((value) {
          listSearch.add(value.docs.first.id);
        });
      });
    }).catchError((e){
      checkSearchErr = true;
    });
   await Future.forEach(listSearch, (element) async {
     Product product = await FunctionFireBase.getProductById(idProduct: element.toString());
     listProduct.add(product);
   });
    update();
    return listProduct;
  }

  @override
  void onInit() {
    textEditingController.text = Get.arguments;
    update();
    searchName();
    super.onInit();
  }
}
