import 'package:flutter/material.dart';
import 'package:order_app/src/first_home.dart';
import 'package:order_app/src/home_src.dart';
import 'package:order_app/src/login.dart';
import 'package:order_app/src/number.dart';
import 'package:order_app/src/onbording.dart';
import 'package:order_app/src/select_location.dart';
import 'package:order_app/src/signin.dart';
import 'package:order_app/src/singup.dart';
import 'package:order_app/src/verification.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeSrc(),
    );
  }
}