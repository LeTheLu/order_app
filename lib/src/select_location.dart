import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/widget/app_bar.dart';

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
            SvgPicture.asset("assets/logo/map.svg"),
            SvgPicture.asset("assets/logo/textLocation.svg")
          ],
        ),
      ),
    );
  }
}
