import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/material.dart';

class InsertProduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InsertProductState();
  }

}

class InsertProductState extends State{
  DbHelper dbHelper = new DbHelper();
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtDescription = new TextEditingController();
  TextEditingController txtPrice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(labelText: "Ad"),
            ),
            TextField(
              controller: txtDescription,
              decoration: InputDecoration(labelText: "Açıklama"),
            ),
            TextField(
              controller: txtPrice,
              decoration: InputDecoration(labelText: "Fiyat"),
            ),
            FlatButton(
              child: Text("Ekle"),
                onPressed: (){insert();},
            )
          ],
        ),
      ),
    );
  }

  void insert() async{
    int result = await dbHelper.add(Product(txtName.text, txtDescription.text, double.tryParse(txtPrice.text)));
    if(result != 0){
      Navigator.pop(context, true);
      AlertDialog alertDialog = new AlertDialog(
        title: Text("İşlem başarılı"),
        content: Text("${txtName.text} ürünü başarıyla eklendi"),
      );
    }
  }

}