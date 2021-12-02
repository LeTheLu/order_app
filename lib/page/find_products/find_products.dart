import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/text_field/search.dart';

class FindProducts extends StatelessWidget {
  const FindProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBarTheme(context,title: "Find Products",),
            search(),
          ],
        )
        ),
    );
  }
}
