import 'package:get/get.dart';
import 'package:order_app/controllers/filters_controller.dart';

class FiltersBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FiltersController());
  }

}