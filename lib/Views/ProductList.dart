import 'package:e_ticaret_app/Views/InsertProduct.dart';
import 'package:e_ticaret_app/Views/ProductDetail.dart';
import 'package:e_ticaret_app/db/db_Helper.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Product> products;
  int productValue = 0;
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = new List<Product>();
      getProducts();
    }
    return Scaffold(
      body: productList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){goInsertProduct();},
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView productList() {
    return ListView.builder(
        itemCount: productValue,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.amberAccent,
            elevation: 1.5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text("A"),
              ),
              title: Text(this.products[position].name),
              subtitle: Text(this.products[position].description),
              onTap: () {
                goDetail(this.products[position]);
              },
            ),
          );
        });
  }

  void getProducts() {
    var dbFuture = dbHelper.createdb();
    dbFuture.then((result) {
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        List<Product> productsData = new List<Product>();

        var incomingProductValue = data.length;
        for (int i = 0; i < incomingProductValue; i++) {
          productsData.add(Product.fromObject(data[i]));
        }
        setState(() {
          products = productsData;
          productValue = incomingProductValue;
        });
      });
    });
  }

  void goDetail(Product product) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }

  void goInsertProduct() async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> InsertProduct()));
    if(result != null){
      if(result){
        getProducts();
      }
    }
  }
}
