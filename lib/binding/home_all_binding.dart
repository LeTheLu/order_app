import 'package:get/get.dart';
import 'package:order_app/controllers/find_products_controller.dart';
import 'package:order_app/controllers/home_all_controller.dart';
import 'package:order_app/controllers/home_controller.dart';
import 'package:order_app/page/favorites/favorites.dart';
import 'package:order_app/page/my_cart/my_cart.dart';

class HomeAllBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeAllController());
    Get.put(HomeController());
    Get.put(FindProductsController());
    Get.put(const MyCart());
    Get.put(const Favorites());
    // TODO: implement dependencies
  }

}