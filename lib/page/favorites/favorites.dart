import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/favorites_controller.dart';
import 'package:order_app/models/product.dart';
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
                      child: GetBuilder<FavoritesController>(
                        builder: (controller) {
                          return StreamBuilder<List<Product>> (
                            initialData: controller.listDataFavorites,
                            stream: controller.getDataTest(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                return ListView.separated(
                                    itemCount: controller.listDataFavorites.length,
                                    separatorBuilder: (context, index) =>
                                    const Divider(),
                                    itemBuilder: (context, index) {
                                      return ItemFavorite(product: snapshot.data![index],);
                                    });
                              }
                              return const Center(child: CircularProgressIndicator(),);
                            },);
                        }
                      ),
                    ))
              ],
            ),
            Positioned(
              bottom: 20,
                child: GetBuilder<FavoritesController>(
                  builder: (controller) {
                    return Button(nameButton: "Add All To Cart",fontSize: 18,onTap: (){controller.addAllToCart();},);
                  }
                ))
          ],
        ),
      ),
    );
  }
}
