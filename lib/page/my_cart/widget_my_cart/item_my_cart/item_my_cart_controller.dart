import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';

class ItemMyCartController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  HomeAllController homeAllController = Get.find();
  int count = 1;
  String id = "";
  int countProduct = 1;

  Future addProduct({required String idProduct}) async {
    id = idProduct;
    count ++;
    update();
    Map<String, int> data = {
      idProduct : count
    };
    await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping").doc("cart").update(data);
    countProductIndex();
  }
  Future minusProduct({required String idProduct}) async {
    id = idProduct;


    if(count > 0){
      count --;
      Map<String, int> data = {
        idProduct : count
      };
      await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping").doc("cart").update(data);
      countProductIndex();
    }
  }
  countProductIndex() async {
    firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping")
        .doc("cart").get().then((value) {
          countProduct = value.data()![id];
          update([id]);
        });
  }
}