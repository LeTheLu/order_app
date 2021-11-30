import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/app_bar.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
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
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Naturel Red Apple", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      SvgPicture.asset("assets/icons/heart.svg"),
                    ],
                  ),
                  Text("1kg, Price" , style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 46,
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("assets/icons/-.svg"),
                            Container(
                              alignment: Alignment.center,
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(17)),
                                border: Border.all(color: ColorApp.borderColor),
                              ),
                              child: Text("1"),
                            ),
                            SvgPicture.asset("assets/icons/+add.svg"),
                          ],
                        ),
                      ),
                      Text("\$4.99", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Divider(thickness: 1,),
                  ExpansionPanel(),
                  )

                ],
              ),
              Positioned(
                top: 0,
                child: appBarTheme(context,iconLeading: const Icon(Icons.arrow_back_ios), iconAction: SvgPicture.asset("assets/icons/upload.svg")),),
            ],
          ),
        ),
      ),
    );
  }
}
