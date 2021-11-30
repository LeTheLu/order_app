import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';

class FirstHome extends StatefulWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  State<FirstHome> createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.themeColor,
      body: Center(
        child: SvgPicture.asset("assets/logo/logo.svg"),
      ),
    );
  }
}

