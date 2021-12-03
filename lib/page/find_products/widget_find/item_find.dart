import 'package:flutter/material.dart';


class ItemFind extends StatelessWidget {
  const ItemFind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                "https://hoaquafuji.com/storage/app/media/NEWS/cac-loai-trai-cay-nhap-khau.jpg",
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return const Center(child: CircularProgressIndicator());
                  // You can use LinearProgressIndicator or CircularProgressIndicator instead
                },
                errorBuilder: (context, error, stackTrace) =>
                    Text('Some errors occurred!'),
              ),
            ),
            const SizedBox(
              height: 44,
              width: 124,
              child: Text("Frash Fruits & Vegetable", overflow: TextOverflow.clip,style: TextStyle(fontSize: 16, fontFamily: "GilroyBold"),),
            )
          ],
        )
    );
  }
}

