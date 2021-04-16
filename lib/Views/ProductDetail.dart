import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget{
  Product product;
  ProductDetail(this.product);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailState(product);
  }
}

DbHelper dbHelper = new DbHelper();

enum Option{delete, update}

class ProductDetailState extends State{
  Product product;
  ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün detayı: ${product.name}"),
        actions: <Widget>[
          PopupMenuButton<Option>(
            onSelected: chooseOp,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Option>>[
            PopupMenuItem<Option>(
                value: Option.delete,
              child: Text("Ürünü sil")
            ),
            PopupMenuItem<Option>(
              value: Option.update,
              child: Text("Ürünü güncelle")
            )
          ],
          )
        ],
      ),
      body: Text("Detay", textDirection: TextDirection.ltr),
    );
  }

  void chooseOp(Option option) async{
    int result;
    switch(option){
      case Option.delete:
        Navigator.pop(context, true);
        result = await dbHelper.delete(product.id);
        if(result != 0){
          AlertDialog alertDialog = new AlertDialog(
            title: Text("İşlem başarılı"),
            content: Text("Ürün silindi: ${product.name}"),
          );
          showDialog(context: context, builder: (_) =>  alertDialog);
        }
        break;
    }
  }
}