import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:order_app/routes/routes.dart';

class SelectLocationController extends GetxController {
  FirebaseFirestore store = FirebaseFirestore.instance;
  String email = Get.arguments;
  String zone = "";
  String area = "";
  String idUser = "";

  Future setZoneAndArea() async {
    Map<String, String> user = {
      "zone": zone,
      "area": area,
    };
    store
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((value) {
      idUser = value.docs.first.id;
      store
          .collection("users")
          .doc(idUser)
          .update(user)
          .then((value) => Get.offAllNamed(Routes.HOME_SCREEN));
    }).catchError((e) {});
  }


}
