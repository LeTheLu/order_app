import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/controllers/search_controller.dart';
import 'package:order_app/page/search/widget_search/widget_search.dart';
import 'package:order_app/routes/routes.dart';
import 'package:order_app/widgets/card/card.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const WidgetSearch(),
                        const SizedBox(
                          width: 20,
                        ),
                        Ink(
                          width: 15,
                          height: 15,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.FILTERS);
                            },
                            child: SvgPicture.asset("assets/icons/filters.svg"),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: GetBuilder<SearchController>(
                            init: SearchController(),
                            builder: (_controller) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
                                child: _controller.listProduct.isEmpty
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : GridView.builder(
                                        itemCount:
                                            _controller.listProduct.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                mainAxisExtent: 248,
                                                maxCrossAxisExtent: 200,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15),
                                        itemBuilder: (context, index) =>
                                            cardItem(
                                                product: _controller.listProduct[index], idProduct: _controller.listProduct[index].id),
                                      ),
                              );
                            }))
                  ],
                ))));
  }
}

/**/
