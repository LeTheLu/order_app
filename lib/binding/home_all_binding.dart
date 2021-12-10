import 'package:get/get.dart';
import 'package:order_app/controllers/favorites_controller.dart';
import 'package:order_app/controllers/find_products_controller.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/controllers/home_controller.dart';
import 'package:order_app/controllers/my_cart_controller.dart';

class HomeAllBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeAllController());
    Get.put(HomeController());
    Get.put(FindProductsController());
    Get.put(MyCartController());
    Get.put(FavoritesController());
    // TODO: implement dependencies
  }

}