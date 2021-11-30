import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

var  list = ['Apple', 'Banana', 'Mango', 'Orange'];
autoCompleteTextField() {
  return Autocomplete(
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == '') {
        return const Iterable<String>.empty();
      }
      return list.where((String option) {
        return option
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase());
      });
    },
    onSelected: (String selection) {
      debugPrint('You just selected $selection');
    },
  );
}
Widget textFieldZone(BuildContext context,{required String title}){
  return SizedBox(
    height: 79,
    width: MediaQuery.of(context).size.width -40,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: ColorApp.greyColor),),
        Stack(
          children: [
            autoCompleteTextField(),
            Positioned(
              right: 10,
                child: GestureDetector(
              onTap: (){},
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/icons/v.svg")),
            ))
          ],
        )],
    ),
  );
}