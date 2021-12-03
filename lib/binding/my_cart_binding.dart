import 'package:get/get.dart';
import 'package:order_app/controllers/my_cart_controller.dart';

class MyCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyCartController());
    // TODO: implement dependencies
  }

}