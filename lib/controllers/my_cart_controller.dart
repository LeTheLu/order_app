import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';

class MyCartController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final HomeAllController homeAllController = Get.find();

  List<String> listCart = [];
  List<Product> listDataProduct = [];

  Future<List<String>> getDataMyCart() async {
    await _firebaseFirestore
        .collection("users")
        .doc(homeAllController.userApp!.idUser)
        .collection("shopping")
        .doc("cart")
        .get()
        .then((value) {
          listCart = value.data()!.keys.toList();
          update();
        }).catchError((e) {});
    return listCart;
  }

  Future<List<Product>> getListDataProduct() async {
    await Future.forEach(listCart, (element) async {
      Product product = await FunctionFireBase.getProductById(idProduct: element.toString());
      listDataProduct.add(product);
    });
    update();
    return listDataProduct;
  }
  @override
  void onInit() async {
    await getDataMyCart();
    await getListDataProduct();
    // TODO: implement onInit
    super.onInit();
  }
}
