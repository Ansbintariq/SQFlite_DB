import 'package:sqflite_crud/helper/database/sqflite_helper.dart';
import 'package:sqflite_crud/model/items_model.dart';

class HelperCart with SQLHelper {
  Future<List<ItemsModel>> getAllCartItems() async {
    var dbClient = await db;
    var res = await dbClient!.query("$cartTable");
    //map((e)=>) works like for loop or for in loop
    List<ItemsModel> list =
        res.isNotEmpty ? res.map((e) => ItemsModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<void> insertItemsInCart(ItemsModel) async {
    var dbClient = await db;
    int response = await dbClient!.insert("$cartTable", ItemsModel.toJson());
  }

  Future<int> delete(int id) async {
    var dbClient = await db;

    return await dbClient!.delete("$cartTable", where: "id=?", whereArgs: [id]);
  }

  Future<int> update(ItemsModel itemsModel, id) async {
    var dbClient = await db;
    return await dbClient!.update(cartTable, itemsModel.toJson(),
        where: 'id = ?', whereArgs: [id]);
  }
}
