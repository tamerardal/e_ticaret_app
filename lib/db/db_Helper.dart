import 'dart:html';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:e_ticaret_app/models/Urun.dart';

class dbHelper{
  String tblProduct = "Products";
  String colID = "id";
  String colName = "Name";
  String colDescription = "Description";
  String colPrice = "Price";

  static final dbHelper _dbHelper = dbHelper._internal();

  factory dbHelper(){
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
    var eTicaretDB = await openDatabase(_path, version: 1, onCreate: create);
    return eTicaretDB;
  }

  dbHelper._internal();

  void create(Database db, int version) async{
    await db.execute("Create Table $tblProduct($colID integer primary key, $colName text, $colDescription text, $colPrice int");
  }

  Future<int> add(Urun product) async{
    Database db = await this.db;
    var result = await db.insert(tblProduct, product.doMap());
    return result;
  }

  Future<int> delete(int id) async{
    Database db = await this.db;
    var result = await db.rawDelete("Delete from $tblProduct where $colID=$id");
    return result;
  }

  Future<int> update(Urun product) async{
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

