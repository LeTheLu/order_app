import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/background/signin.png")
        ],
      ),
    );
  }
}
