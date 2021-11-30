import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:order_app/routes/pages.dart';
import 'package:order_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Routes.PRODUCT_DETAIL,
      getPages: Pages.pages,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}