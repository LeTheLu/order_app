import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/models/user.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Product> dataExclusiveOffer = [];
  List<Product> dataBestSelling = [];
  List<Product> dataGroceries = [];
  String areaUser = "";
  String zoneUser = "";
  String emailUser = Get.arguments;
  User? user;
  
  Future getUser() async {
    await _firebaseFirestore.collection("users")
        .where("email", isEqualTo: emailUser)
        .get().then((value){
      user = User.fromJson(value.docs.first.data());
      areaUser = user!.area!;
      zoneUser = user!.zone!;
      update();
    })
        .catchError((e){});
  }

  Future<List<Product>> getDataExclusiveOffer() async {
    List listData = [];
    Product sanPham;
    await _firebaseFirestore.collection("promotions").doc("ExclusiveOffer").get().
    then((value){
      listData = value.data()!.values.first;
    });
    await Future.forEach(listData, (element) async {
      sanPham = await FunctionFireBase.getProductById(idProduct: element.toString());
      dataExclusiveOffer.add(sanPham);
      update();
    });
    return dataExclusiveOffer;
  }

  Future<List<Product>> getDataBestSelling() async {
    List listData = [];
    Product sanPham;
    await _firebaseFirestore.collection("promotions").doc("BestSelling").get().
    then((value){
      listData = value.data()!.values.first;
    });
    await Future.forEach(listData, (element) async {
      sanPham = await FunctionFireBase.getProductById(idProduct: element.toString());
      dataBestSelling.add(sanPham);
      update();
    });
    return dataBestSelling;
  }

  Future<List<Product>> getDataGroceries() async {
    List listData = [];
    Product sanPham;
    await _firebaseFirestore.collection("promotions").doc("Groceries").get().
    then((value){
      listData = value.data()!.values.first;
    });
    await Future.forEach(listData, (element) async {
      sanPham = await FunctionFireBase.getProductById(idProduct: element.toString());
      dataGroceries.add(sanPham);
      update();
    });
    return dataGroceries;
  }

  @override
  void onInit() {
    getUser();
    getDataExclusiveOffer();
    getDataBestSelling();
    getDataGroceries();
    super.onInit();
  }
}

