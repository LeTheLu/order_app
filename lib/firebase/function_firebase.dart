import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_app/models/product.dart';

class FunctionFireBase {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Future<Product> getProductById({required String idProduct}) async {
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

  static Future addProduct() async {

  }

}
