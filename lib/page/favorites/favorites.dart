import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
                          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: controller.streamFavorites,
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                return ListView.separated(
                                  itemCount: snapshot.data!.data()!.length,
                                  separatorBuilder: (context, index) => const Divider(),
                                  itemBuilder: (context, index) {
                                    if(snapshot.hasData){
                                      controller.listFavorite = snapshot.data!.data()!.keys.toList();
                                      return FutureBuilder<Product>(
                                        future: controller.getItemDataFavorites(idProduct: controller.listFavorite[index]),
                                        builder: (context, snapshotF) {
                                          if(snapshotF.hasData){
                                            return ItemFavorite(product: snapshotF.data!,);
                                          }
                                          return const Center(child: CircularProgressIndicator(),);
                                        },);
                                    }
                                    return const Center(child: CircularProgressIndicator(),);
                                  },

                                );
                              }
                              return const Center(child: CircularProgressIndicator(),);
                            }
                          );
                        }
                      ),
                    ))
              ],
            ),
            Positioned(
              bottom: 104,
                child: Button(nameButton: "Add All To Cart",fontSize: 18,onTap: (){},))
          ],
        ),
      ),
    );
  }
}
