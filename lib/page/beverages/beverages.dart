import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/page/find_products/widget_find/item_find.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/card/card.dart';

class Beverages extends StatelessWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBarTheme(context,title: "Beverages", iconLeading: const Icon(Icons.arrow_back_ios), iconAction: SvgPicture.asset("assets/icons/filters.svg")),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 248,
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) => SizedBox(),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
