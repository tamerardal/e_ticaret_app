import 'package:e_ticaret_app/Views/ProductList.dart';
import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:flutter/material.dart';
import 'db/db_Helper.dart';
import 'package:e_ticaret_app/models/Urun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = new List<Product>();
    DbHelper dbHelper = new DbHelper();
    dbHelper.createdb().then((database) => {});

/*    Product prod1 = new Product("Android TV", "OLED 52''", 7000);
    dbHelper.add(prod1);
    Product prod2 = new Product("MacBook", "Pro", 16000);
    dbHelper.add(prod2);
    Product prod3 = new Product("IPhone 12", "Max", 12000);
    dbHelper.add(prod3);
    Product prod4 = new Product("Apple Watch", "Seri 6", 1000);
    dbHelper.add(prod4);*/

    return MaterialApp(
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnasayfaState();
  }

}

class AnasayfaState extends State<Anasayfa>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e-Ticaret Uygulaması"),
      ),
      body: ProductList(),
    );
  }

}