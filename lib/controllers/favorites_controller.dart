import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/my_cart_controller.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';

import 'home_all_controller.dart';

class FavoritesController extends GetxController{
  HomeAllController homeAllController = Get.find();
  MyCartController myCartController = Get.find();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late QuerySnapshot<Map<String, dynamic>> initDataFavorite;

  List<String> listIdItemFavorite = [];
  List<Product> listDataFavorites = [];
  get  listDataFavoritesObs => listDataFavorites.obs;

  Stream<List<Product>> getDataTest() async* {
    yield listDataFavorites;
  }

  Future  initData() async {
    List<Product> listTest = [];
    await Future.forEach(listIdItemFavorite, (element) async {
      Product product = await FunctionFireBase.getProductById(
          idProduct: element.toString());
      listTest.add(product);
    });
    listDataFavorites = listTest;
  }

  addAllToCart(){
    List<Product> list = myCartController.listDataCart + listDataFavorites;
    for (var elementCA in myCartController.listDataCart) {
      for (var elementFA in listDataFavorites) {
        if(elementCA.id == elementFA.id){
          list.removeWhere((element) => element == elementCA);
        }
      }
    }
    myCartController.listDataCart = list;
    listDataFavorites.clear();
    update();
  }

  @override
  void onInit() async {
    initDataFavorite = homeAllController.initDataFavorite;
    for (var element in initDataFavorite.docs) {
      listIdItemFavorite.add(element.id);
    }
    await initData();
    super.onInit();
  }
}