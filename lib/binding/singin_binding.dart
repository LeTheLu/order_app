import 'package:get/get.dart';
import 'package:order_app/controllers/singin_controller.dart';

class SingIn extends Bindings{
  @override
  void dependencies() {
    Get.put(SingInController());
  }

}