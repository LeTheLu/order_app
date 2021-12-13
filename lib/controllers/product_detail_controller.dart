import 'package:get/get.dart';
import 'package:order_app/models/product.dart';

import 'favorites_controller.dart';
import 'home_all_controller.dart';
class ProductDetailController extends GetxController {
  bool checkLike = false;
  HomeAllController homeAllController = Get.find();
  FavoritesController favoritesController = Get.find();
  Product product = Get.arguments;

  @override
  void onInit() {
    checkLike = favoritesController.listFavorite.contains(product.id);
    super.onInit();
  }
}