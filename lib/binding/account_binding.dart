import 'package:get/get.dart';
import 'package:order_app/controllers/account_controller.dart';

class AccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AccountController());
    // TODO: implement dependencies
  }

}