import 'package:flutter/material.dart';
import 'package:order_app/page/find_products/widget_find/item_find.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return const ItemFind();
                  },
                ),
              ),
            ),
          ],
        )
        ),
    );
  }
}
