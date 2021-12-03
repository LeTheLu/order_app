import 'package:get/get.dart';
import 'package:order_app/controllers/order_accepted_controller.dart';

class OrderAcceptedBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OrderAcceptedController());
    // TODO: implement dependencies
  }

}