import 'package:flutter/material.dart';

List<Color> listColors = [
  const Color.fromARGB(25, 83, 177, 117),
  const Color.fromARGB(25, 248, 164, 76),
  const Color.fromARGB(64, 247, 165, 147),
  const Color.fromARGB(64, 211, 176, 224),
  const Color.fromARGB(64, 253, 229, 152),
  const Color.fromARGB(64, 183, 223, 245),
  const Color.fromARGB(38, 131, 106, 246),
  const Color.fromARGB(38, 215, 59, 119),
  const Color(0xFF53B175).withOpacity(0.5)
];

void main(){
  runApp(const ItemCartFind());
}

class ItemCartFind extends StatefulWidget {
  const ItemCartFind({Key? key}) : super(key: key);

  @override
  State<ItemCartFind> createState() => _ItemCartFindState();
}

class _ItemCartFindState extends State<ItemCartFind> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              height: 189.11,
              width: 174.5,
              decoration: BoxDecoration(
                  color: Color.fromARGB(25, 83, 177, 117),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                border: Border.all(
                  color: Color.fromARGB(25*10, 83, 177, 117),
                  width: 1
                )
              ),
              child: Column(
                children: [

                ],
              )
          ),
        ),
      ),
    );
  }
}
