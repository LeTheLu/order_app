import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:order_app/page/product_detail/widget_prduct_detail/expand_pro.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/appbar/app_bar.dart';
import 'package:order_app/widgets/button/button.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  final int _numberDot = 3;
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: _numberDot, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 371.44,
                      width: 413.6,
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F3F2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            onPageChanged: (value) =>
                                _controller.animateTo(value),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Image.asset("assets/background/apple.png");
                            },
                          ),
                          Positioned(
                              bottom: 30,
                              child: TabPageSelector(
                                controller: _controller,
                                indicatorSize: 10,
                                selectedColor: ColorApp.themeColor,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Naturel Red Apple",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SvgPicture.asset("assets/icons/heart.svg"),
                            ],
                          ),
                          const SizedBox(
                            height: 10.5,
                          ),
                          Text("1kg, Price",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                          const SizedBox(
                            height: 30.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 46,
                                width: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset("assets/icons/-.svg"),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 46,
                                      width: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                        border: Border.all(
                                            color: ColorApp.borderColor),
                                      ),
                                      child: Text("1"),
                                    ),
                                    SvgPicture.asset("assets/icons/+add.svg"),
                                  ],
                                ),
                              ),
                              Text(
                                "\$4.99",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30.5,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const WidgetProductDetail(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const WidgetNutrition(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const WidgetReview(),
                          const SizedBox(
                            height: 20,
                          ),
                          Button(
                            nameButton: "Add To Basket",
                            fontSize: 18,
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 0,
                  child: appBarTheme(context,
                      iconLeading: const Icon(Icons.arrow_back_ios),
                      iconAction: SvgPicture.asset("assets/icons/upload.svg"),
                      onPressedLeading: () {
                    Get.back();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
