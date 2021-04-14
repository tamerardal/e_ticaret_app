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

  dbHelper._internal();
}