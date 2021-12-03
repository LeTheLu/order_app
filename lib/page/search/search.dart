import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/widgets/card/card.dart';
import 'package:order_app/widgets/text_field/search.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  search(),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){

                    },
                    child: SizedBox(
                      width: 15,
                        height: 15,
                        child: SvgPicture.asset("assets/icons/filters.svg")),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 248,
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15),
                      itemBuilder: (context, index) => cardItem(rightVetical: 0,title: "title",properties: "properties",price: "price" ,image: "https://cf.shopee.vn/file/7005c74de8dea2ca74a5a6682cb06689"),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
