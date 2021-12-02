import 'package:get/get.dart';
import 'package:order_app/controllers/product_detail_controller.dart';

class ProductDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductDetailController());
  }
}