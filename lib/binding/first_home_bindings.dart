import 'package:get/get.dart';
import 'package:order_app/controllers/first_home_controller.dart';

class FirstHomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(FirstHomeController());
  }
}