import 'package:get/get.dart';
import 'package:order_app/controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FavoritesController());
    // TODO: implement dependencies
  }

}