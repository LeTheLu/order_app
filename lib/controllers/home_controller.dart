import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:order_app/models/product.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Product> dataExclusiveOffer = [];
  List<Product> dataBestSelling = [];
  List<Product> dataGroceries = [];

  Future<List<Product>> getDataExclusiveOffer() async {
    List listData = [];
    Product sanPham;
    await _firebaseFirestore.collection("promotions").doc("ExclusiveOffer").get().
    then((value){
      listData = value.data()!.values.first;
    });
    await Future.forEach(listData, (element) async {
      sanPham = await getProductById(idProduct: element.toString());
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
      sanPham = await getProductById(idProduct: element.toString());
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
      sanPham = await getProductById(idProduct: element.toString());
      dataGroceries.add(sanPham);
      update();
    });
    return dataGroceries;
  }

  Future<Product> getProductById({required String idProduct}) async {
    DocumentSnapshot<Map<String, dynamic>> product;
    Product sanpham;

    product = await _firebaseFirestore.collection("product").doc("sanpham").collection("drinks").doc(idProduct).get();
    if(product.data() == null){
      product = await _firebaseFirestore.collection("product").doc("sanpham").collection("foods").doc(idProduct).get();
      if(product.data() == null){
        product = await _firebaseFirestore.collection("product").doc("sanpham").collection("fruits").doc(idProduct).get();
      }
    }

    sanpham = Product(
      description: product.data()!["description"],
      price:  product.data()!["price"],
      name:  product.data()!["name"],
      img: product.data()!["img"],
      type: product.data()!["type"],
    );


    return sanpham;
  }

  @override
  void onInit() {
    getDataExclusiveOffer();
    getDataBestSelling();
    getDataGroceries();
    super.onInit();
  }
}

