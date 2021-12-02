import 'package:get/get.dart';
import 'package:order_app/controllers/singup_controller.dart';

class SingUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SingUpController());
  }

}