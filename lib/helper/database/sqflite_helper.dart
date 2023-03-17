import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

import 'package:sqflite_crud/model/items_model.dart';

class SQLHelper {
  String tableName = "items";
  String cartTable = "cart";
  static Database? _database;
  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,title TEXT,desc TEXT,quantity INTEGER)");
    await db.execute(
        'CREATE TABLE $cartTable( id integer primary key autoincrement, title TEXT,desc TEXT,quantity INTEGER)');
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "crud.db");
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<void> insertItems(ItemsModel) async {
    var dbClient = await db;
    int response = await dbClient!.insert("$tableName", ItemsModel.toJson());
  }

  Future<List<ItemsModel>> getAllItems() async {
    var dbClient = await db;
    var res = await dbClient!.query("$tableName");
    //map((e)=>) works like for loop or for in loop
    List<ItemsModel> list =
        res.isNotEmpty ? res.map((e) => ItemsModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;

    return await dbClient!.delete("$tableName", where: "id=?", whereArgs: [id]);
  }

  Future<int> update(ItemsModel itemsModel, id) async {
    var dbClient = await db;
    return await dbClient!.update(tableName, itemsModel.toJson(),
        where: 'id = ?', whereArgs: [id]);
  }
}
