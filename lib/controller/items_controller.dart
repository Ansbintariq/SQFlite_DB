import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/helper/database/ulit.dart';
import '../helper/database/sqflite_helper.dart';
import 'package:path_provider/path_provider.dart';
import '../model/items_model.dart';

class Itemscontroller extends GetxController {
  final itemsList = <ItemsModel>[].obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editDescController = TextEditingController();
  TextEditingController searchtextController = TextEditingController();
  Future<void> addToDb(ItemsModel itemsModel) async {
    // print("title ${itemsModel.title} ");
    // print("desc ${itemsModel.desc} ");
    await SQLHelper().insertItems(itemsModel);
    titleController.clear();
    descController.clear();
  }

  Future<void> getItemsToDb() async {
    itemsList.value = await SQLHelper().getAllItems();
    // print(itemsList.value);
  }

  Future<int> deleteItemsDb(int id) async {
    await SQLHelper().delete(id);
    return id;
  }

  Future<int> updateItemsDb(ItemsModel itemsModel, id) async {
    await SQLHelper().update(itemsModel, id);
    editTitleController.clear();
    editDescController.clear();
    return id;
  }

  var isLoading = false.obs;

  final foundproduct = [].obs;
  // final foundproduct = <Products>[].obs;
  final allItems = <ItemsModel>[].obs;
  searchItemsByName(String value) async {
    final allItems = itemsList;
    //  RxList results = <ItemsModel>[].obs;

    if (value.isEmpty) {
      // results.value = allItems;
      foundproduct.value = allItems;
    } else {
      foundproduct.value = allItems
          .where((items) =>
              items.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      //  foundproduct.value = results;
    }
    // print(foundproduct.value);
    return foundproduct.value;
  }
}
