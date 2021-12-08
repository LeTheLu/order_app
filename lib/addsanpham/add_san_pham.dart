import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_app/addsanpham/data.dart';
import 'package:order_app/utils/colors.dart';
import 'package:order_app/widgets/button/button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AddSanPham());
}

class AddSanPham extends StatefulWidget {
  const AddSanPham({Key? key}) : super(key: key);

  @override
  _AddSanPhamState createState() => _AddSanPhamState();
}

class _AddSanPhamState extends State<AddSanPham> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController img01Controller = TextEditingController();
  TextEditingController img02Controller = TextEditingController();
  TextEditingController img03Controller = TextEditingController();

  final FirebaseFirestore _storeFirebase = FirebaseFirestore.instance;
  String dropdownValue = "drinks";
  late String collection;


@override
  void initState() {
  collection = "drinks";
    super.initState();
  }


  addDrinks(){
    for (var element in Data.dataDrinks) {
      addSanPham(element);
    }
  }
  addFoods(){
    for (var element in Data.dataFoods) {
      addSanPham(element);
    }
  }
  addFruits(){
    for (var element in Data.dataFruits) {
      addSanPham(element);
    }
  }


  addSanPham(product){
    _storeFirebase.collection("product").doc("sanpham").collection(collection).add(product).then((value) {
      print("Done");
    } ).catchError((e)=> print("Err "));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: ColorApp.themeColor),
              underline: Container(
                height: 2,
                color: ColorApp.themeColor,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  collection = newValue;
                });
              },
              items: <String>['drinks', 'foods', 'fruits']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
                Button(
                  nameButton: "Add SanPham",
                  onTap: (){
                    switch (collection){
                      case "drinks" : {
                        addDrinks();
                        break;
                      }
                      case "foods" : {
                        addFoods();
                        break;
                      }
                      case "fruits" : {
                        addFruits();
                        break;
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
