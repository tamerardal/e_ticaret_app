import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:e_ticaret_app/models/Urun.dart';

class DbHelper{
  String tblProduct = "products";
  String colID = "id";
  String colName = "name";
  String colDescription = "description";
  String colPrice = "price";

  static final DbHelper _dbHelper = DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async{
    if(_db == null){
      _db = await createdb();
    }
    return _db;
  }
  Future<Database> createdb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String _path = directory.path + "eticaret.db";
    var eTicaretDb = await openDatabase(_path, version: 1, onCreate: create);
    return eTicaretDb;
  }

  DbHelper._internal();

  void create(Database db, int version) async{
    await db.execute("Create Table $tblProduct($colID integer primary key, $colName text, $colDescription text, $colPrice int)");
  }

  Future<int> add(Product product) async{
    Database db = await this.db;
    var result = await db.insert(tblProduct, product.doMap());
    return result;
  }

  Future<int> delete(int id) async{
    Database db = await this.db;
    var result = await db.rawDelete("Delete from $tblProduct where $colID=$id");
    return result;
  }

  Future<int> update(Product product) async{
    Database db = await this.db;
    var result = await db.update(tblProduct, product.doMap());
    return result;
  }

  Future<List> getProducts() async{
    Database db = await this.db;
    var result = await db.rawQuery("Select * from $tblProduct");
    return result;
  }
}

