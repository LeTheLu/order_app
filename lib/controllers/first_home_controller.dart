
import 'package:get/get.dart';
import 'package:order_app/routes/routes.dart';

class FirstHomeController extends GetxController {

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), (){
      Get.toNamed(Routes.WELCOME_PAGE);
    });
    super.onReady();
  }
}