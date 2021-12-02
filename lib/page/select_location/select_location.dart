import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/select_location_controller.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button.dart';
import 'package:order_app/page/select_location/widget_select_location/text_field.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarTheme(context,
                  iconLeading: const Icon(Icons.arrow_back_ios),
                  onPressedLeading: () {}),
              const SizedBox(
                height: 30,
              ),
              Image.asset("assets/logo/map.jpg"),
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset("assets/logo/textLocation.svg"),
              const SizedBox(
                height: 90,
              ),
              textFieldZone(
                context,
                title: "Your Zone",
              ),
              textFieldZone(
                context,
                title: "Your Area",
              ),
              const SizedBox(
                height: 80,
              ),
              GetBuilder<SelectLocationController>(
                init: SelectLocationController(),
                builder: (controller) => Button(
                  nameButton: "Submit",
                  fontSize: 18,
                  onTap: () {
                    controller.setZoneAndArea();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
