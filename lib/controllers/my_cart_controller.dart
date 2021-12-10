import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/page/my_cart/widget_my_cart/item_my_cart/item_my_cart_controller.dart';
class MyCartController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final HomeAllController homeAllController = Get.find();
  late Stream<DocumentSnapshot<Map<String, dynamic>>> streamCart;

  List<String> listCart = [];
  List<Product> listDataProduct = [];
  double total = 0.0;

  Future<List<String>> getDataMyCart() async {
    await _firebaseFirestore
        .collection("users")
        .doc(homeAllController.userApp.idUser)
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
      Product product = await FunctionFireBase.getProductById(
          idProduct: element.toString());
      listDataProduct.add(product);
    });
    update();
    return listDataProduct;
  }

  Future getTotal() async {
    for(String ele in listCart){
      ItemMyCartController itemMyCartController = Get.find(tag: ele);
      total = total + itemMyCartController.totalItem;
      update();
    }
  }

  @override
  void onInit() async {
    await getDataMyCart();
    await getListDataProduct();
    streamCart = FirebaseFirestore.instance.collection('users').doc(homeAllController.userApp.idUser).collection("shopping").doc("cart").snapshots();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() async {
    //await getTotal();
    super.onReady();
  }
}
