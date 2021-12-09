import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/models/product.dart';

class ItemMyCartController extends GetxController{
  Product product;
  ItemMyCartController({required this.product});

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  HomeAllController homeAllController = Get.find();
  int countProduct = 0;


  Future addProduct({required String idProduct}) async {
    int count = await countProductIndex(idProduct: idProduct);
    count ++;
    Map<String, int> data = {
      idProduct : count
    };
    await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping").doc("cart").update(data);
    countProduct = await countProductIndex(idProduct: idProduct);
    update([idProduct]);
  }

  Future minusProduct({required String idProduct}) async {
    int count = await countProductIndex(idProduct: idProduct);
    if(count > 0){
      count --;
      Map<String, int> data = {
        idProduct : count
      };
      await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping").doc("cart").update(data);
      countProduct = await countProductIndex(idProduct: idProduct);
      update([idProduct]);
    }
  }

  Future<int> countProductIndex({required String idProduct}) async {
    int count = 0;
    await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping")
        .doc("cart").get().then((value) {
          count = value.data()![idProduct];
        });
    return count;
  }

  Future<int> countProductIndexInit({required String idProduct}) async {
    int count = 0;
    await firebaseFirestore.collection("users").doc(homeAllController.userApp!.idUser).collection("shopping")
        .doc("cart").get().then((value) {
      count = value.data()![idProduct];
    });
    return count;
  }



  @override
  void onInit() async {
    countProduct = await countProductIndexInit(idProduct: product.id);
    print(product.id);
    update([product.id]);
    // TODO: implement onInit
    super.onInit();
  }
}