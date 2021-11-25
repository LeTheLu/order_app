import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_app/colors.dart';
import 'package:order_app/widget/button/button.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/onbording_backgroud.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 1,
              child: SizedBox()),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/logo/logo01.svg"),
                  const SizedBox(height: 20,),
                  SvgPicture.asset("assets/text/welcome_to_our_store.svg"),
                  const SizedBox(height: 20,),
                  SvgPicture.asset("assets/text/ger_your_groceries_in_as_fast_as_one_hour.svg"),
                  const SizedBox(height: 20,),
                  buttonBig(nameButton: "Get Started"),
                ],
              ))
        ],
      ),
    ));
  }
}
