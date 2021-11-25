import 'package:flutter/material.dart';
import 'package:order_app/src/first_home.dart';
import 'package:order_app/src/onbording.dart';
import 'package:order_app/src/signin.dart';
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
      home: SignIn(),
    );
  }
}