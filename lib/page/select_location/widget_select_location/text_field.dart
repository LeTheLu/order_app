import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/select_location_controller.dart';
import 'package:order_app/utils/location.dart';

import '../../../utils/colors.dart';

class TextFieldZone extends StatelessWidget {
  const TextFieldZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLocationController>(
      init: SelectLocationController(),
      builder: (controller) => SizedBox(
        height: 79,
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Zone",
              style: TextStyle(fontSize: 16, color: ColorApp.greyColor),
            ),
            Stack(
              children: [
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return LocationData.listBaMien.where((String option) {
                      return option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {

                  },
                ),
                Positioned(
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset("assets/icons/v.svg")),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldArea extends StatelessWidget {
  TextFieldArea({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SelectLocationController>(
      init: SelectLocationController(),
      builder: (controller) => SizedBox(
        height: 79,
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Area",
              style: TextStyle(fontSize: 16, color: ColorApp.greyColor),
            ),
            Stack(
              children: [
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return controller.checkLocation.where((String option) {
                      return option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {

                  },
                ),
                Positioned(
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset("assets/icons/v.svg")),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
