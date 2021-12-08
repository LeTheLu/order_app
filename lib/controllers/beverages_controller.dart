import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';

class BeveragesController extends GetxController{
  
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  TextEditingController textEditingController = TextEditingController();
  List<Product> listProduct = [];
  String idDoc = Get.arguments;
  
  
  Future getDataItemFindProductHome() async {
    List list = [];
    await _store.collection("FindProducts").doc(idDoc).get().then((value){
      list = value.data()!["product"];
    }).catchError((e){});
    for (var element in list) {
      Product product = await FunctionFireBase.getProductById(idProduct: element);
      listProduct.add(product);
    }
    update();
  }


  @override
  void onInit() {
    getDataItemFindProductHome();
    // TODO: implement onInit
    super.onInit();
  }
}