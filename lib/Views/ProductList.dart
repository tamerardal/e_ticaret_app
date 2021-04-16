import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State{
  dbHelper dbhelper = new dbHelper();
  List<Urun> products;
  int productValue = 0;
  @override
  Widget build(BuildContext context) {
    if(products == null){
      products = new List<Urun>();
      getProducts();
    }
    return ListView.builder(
      itemCount: productValue,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.lightBlueAccent,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            title: Text(this.products[position].name),
            subtitle: Text(this.products[position].description),
            onTap: (){},
          ),
        );
      }
    );
  }

  void getProducts() {
    var dbFuture = dbhelper.createdb();
    dbFuture.then((result){
      var productsFuture = dbhelper.getProducts();
      productsFuture.then((data){
        List<Urun> productsData = new List<Urun>();

        var incomingProductValue = data.length;
        for(int i=0; i<incomingProductValue; i++){
          productsData.add(Urun.fromObject(data[i]));
        }
        setState(() {
          products = productsData;
          productValue = incomingProductValue;
        });
      });
    });
  }
}