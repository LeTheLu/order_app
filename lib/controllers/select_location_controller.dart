import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:order_app/firebase/function_firebase.dart';
import 'package:order_app/models/user.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/utils/location.dart';

class SelectLocationController extends GetxController {
  var checkLocation = ["Hồ Chí Minh", "Hà Nội", "Đà Nẵng"];
  String zone = "";
  String area = "";
  String email = Get.arguments;
  String idUser = "";
  
 FirebaseFirestore store = FirebaseFirestore.instance;

  Future setZoneAndArea() async {
    Map<String, String> user = {
      "zone": zone,
      "area": area,
    };
    await store.collection("users").where("email", isEqualTo: email).get().then((value) async {
      idUser = value.docs.first.id;
      await store.collection("users").doc(idUser).update(user).then((value) async {
        UserApp userApp = await FunctionFireBase.getInfoUser(email: email);
        Get.offAllNamed(Routes.HOMEALL, arguments: userApp);
      }).catchError((e) {});
  });
  }
  locationData(){
    switch(zone){
      case "Miền Bắc" : {
        checkLocation = LocationData.listBac;
        update();
        break;
      }
      case "Miền Trung" : {
        checkLocation = LocationData.listTrung;
        break;
      }
      case "Miền Nam" : {
        checkLocation = LocationData.listNam;
        update();
        break;
      }
      default : {
        checkLocation = LocationData.listDefault;
        update();
      }
    }
  }
@override
  void onInit() {
  locationData();
  update();
    super.onInit();
  }
}
