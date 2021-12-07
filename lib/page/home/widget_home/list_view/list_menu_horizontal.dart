import 'package:flutter/material.dart';

List<Map<String, String>> FAKE_DATA = [
  {
    "img":
        "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872",
    "title": "Pulses"
  },
  {
    "img":
        "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872",
    "title": "Pulses"
  },
  {
    "img":
        "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872",
    "title": "Pulses"
  },
  {
    "img":
        "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872",
    "title": "Pulses"
  },
  {
    "img":
        "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bananas-218094b-scaled.jpg?quality=90&resize=960%2C872",
    "title": "Pulses"
  }
];

class ListMenuHorizontal extends StatelessWidget {
  const ListMenuHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: FAKE_DATA.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(right: 15),
            width: 248.19,
            height: 105,
            decoration: BoxDecoration(
              color: index %2 == 0 ? const Color(0xFFF8A44C).withOpacity(0.5) : const Color(0xFF53B175).withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15, left: 17),
                  height: 72,
                  width: 72,
                  child: Image.network(
                    FAKE_DATA[index]["img"] ?? "",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                          child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) =>
                    const Text('Toang'),
                  ),
                ),
                Text(FAKE_DATA[index]["title"] ?? "", style: const TextStyle(fontSize: 20),),
              ],
            ),
          )),
    );
  }
}

