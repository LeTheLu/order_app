import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FindProductsController extends GetxController{
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  TextEditingController textEditingController = TextEditingController();
  List<Map<String, String>> list = [];
  
  
  
  Future<List<Map<String, String>>> getDataHomeFind() async {
    List<Map<String, String>> listHomeFind = [];
    await _store.collection("FindProducts").get().then((value) async {
        for(var element in value.docs){
          await _store.collection("FindProducts").doc(element.id).get().then((value){
            Map<String, String> map = {
              "img" : value["img"],
              "id" : element.id,
            };
            listHomeFind.add(map);
          });
      }
    });
    return listHomeFind;
  }

  @override
  void onInit() async {
    list = await getDataHomeFind();
    update();
    super.onInit();
  }

}