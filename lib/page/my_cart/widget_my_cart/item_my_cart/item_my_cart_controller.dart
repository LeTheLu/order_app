import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/models/product.dart';

class ItemMyCartController extends GetxController{
  Product product;
  ItemMyCartController({required this.product});

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  HomeAllController homeAllController = Get.find();
  MyCartController myCartController = Get.find();
  var countProduct = 0.obs;
  double totalItem = 0.0;


  Future addProduct({required String idProduct}) async {
    countProduct ++;
    totalItem = double.parse(product.price)*countProduct.toInt();
    update([product.id]);
    //myCartController.getTotal();
  }

  Future minusProduct({required String idProduct}) async {
    if(countProduct > 0){
      countProduct --;
      totalItem = double.parse(product.price)*countProduct.toInt();
      update([product.id]);
      //myCartController.getTotal();
    }
  }

  /*Future countProductInit() async {
    await firebaseFirestore.collection("users").doc(homeAllController.userApp.idUser).collection("shopping")
        .doc("cart").get().then((value) {
      int index = value.data()![product.id];
      countProduct = index.obs;
        });
  }*/

  @override
  void onInit() async {
    //await countProductInit();
    totalItem = double.parse(product.price)*countProduct.toDouble();
    update([product.id]);
    debounce(countProduct, (_) async {
      Map<String, int> data = {
        product.id : countProduct.toInt()
      };
      await firebaseFirestore.collection("users").doc(homeAllController.userApp.idUser).collection("shopping").doc("cart").update(data);
    }, time: const Duration(milliseconds: 1500));
    // TODO: implement onInit
    super.onInit();
  }
}