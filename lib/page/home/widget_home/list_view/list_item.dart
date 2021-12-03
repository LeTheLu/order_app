import 'package:flutter/material.dart';
import 'package:order_app/widgets/card/card.dart';


String urlImg = "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872";

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => cardItem(
            title: "banana" ,
            image: urlImg,
            price: "100",
            properties: "200" ),),
    );
  }
}
