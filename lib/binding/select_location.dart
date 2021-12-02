import 'package:get/get.dart';
import 'package:order_app/controllers/select_location_controller.dart';

class SelectLocationBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(SelectLocationController());
  }

}