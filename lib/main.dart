import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:flutter/material.dart';
import 'Views/ProductList.dart';
import 'db/db_Helper.dart';
import 'models/Urun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Urun> products = new List<Urun>();
    dbHelper dbhelper = new dbHelper();
    dbhelper.createdb().then((database) => {});

    Urun prod1 = new Urun("Android TV", "OLED 52''", 7000);
    dbhelper.add(prod1);
    Urun prod2 = new Urun("MacBook", "Pro", 16000);
    dbhelper.add(prod2);
    Urun prod3 = new Urun("IPhone 12", "Max", 12000);
    dbhelper.add(prod3);
    Urun prod4 = new Urun("Swatch", "Colorful", 1000);
    dbhelper.add(prod4);

    return MaterialApp(
      title: "E-Ticaret Uygulaması",
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