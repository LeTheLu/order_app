import 'package:get/get.dart';
import 'package:order_app/controllers/beverages_controller.dart';

class BeveragesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BeveragesController());
  }

}