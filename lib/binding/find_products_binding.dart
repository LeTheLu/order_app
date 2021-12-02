import 'package:get/get.dart';
import 'package:order_app/controllers/find_products_controller.dart';

class FindProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FindProductsController());
  }

}