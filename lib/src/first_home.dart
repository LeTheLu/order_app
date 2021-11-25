import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/colors.dart';

class FirstHome extends StatefulWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  _FirstHomeState createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {


  @override
  void initState() {

    super.initState();
  }
  navigatorPart() async {
    await Future.delayed(const Duration(seconds: 3));

  }

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
