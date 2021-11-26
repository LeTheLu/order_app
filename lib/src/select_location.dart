import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/widget/app_bar.dart';
import 'package:order_app/widget/button/button.dart';
import 'package:order_app/widget/text_field/text_field.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBarTheme(context, iconLeading: const Icon(Icons.arrow_back_ios), onPressedLeading: (){}),
            const SizedBox(height: 30,),
            Image.asset("assets/logo/map.jpg"),
            const SizedBox(height: 40,),
            SvgPicture.asset("assets/logo/textLocation.svg"),
            const SizedBox(height: 90,),
            textFieldZone(context, title: "Your Zone",),
            textFieldZone(context, title: "Your Area",),
            const SizedBox(height: 80,),
            buttonBig(nameButton: "Submit", fontSize: 18)
          ],
        ),
      ),
    );
  }
}
