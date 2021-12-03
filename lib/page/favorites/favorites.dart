import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/page/favorites/widget_favorites/item_favorites.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                appBarTheme(context,title: "Favorites"),
                const Divider(),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) => ItemFavorite(),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: 3),
                    ))
              ],
            ),
            Positioned(
              bottom: 104,
                child: Button(nameButton: "Add All To Cart",fontSize: 18,))
          ],
        ),
      ),
    );
  }
}
