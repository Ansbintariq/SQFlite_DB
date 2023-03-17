import 'package:get/get.dart';
import 'package:sqflite_crud/helper/database/cart_helper.dart';
import 'package:sqflite_crud/model/items_model.dart';
import 'package:flutter/material.dart';
import '../helper/database/sqflite_helper.dart';

class CartController extends GetxController {
  final cartList = <ItemsModel>[].obs;
  Future<void> addCartToDb(ItemsModel itemsModel) async {
    // print("title ${itemsModel.title} ");
    // print("desc ${itemsModel.desc} ");

    await HelperCart().insertItemsInCart(itemsModel);
    await getAllCartItems();
  }

  Future<void> getAllCartItems() async {
    cartList.value = await HelperCart().getAllCartItems();

    update();
  }

  Future<int> deleteCartItems(int id) async {
    await HelperCart().delete(id);
    return id;
  }

  Future<int> updateCartQuntity(ItemsModel itemsModel, id) async {
    await HelperCart().update(itemsModel, id);

    return id;
  }

  increment(int index) {
    cartList[index].quantity = cartList[index].quantity! + 1;
    updateCartQuntity(
        ItemsModel(
          id: cartList[index].id,
          title: cartList[index].title,
          desc: cartList[index].desc,
          quantity: cartList[index].quantity,
        ),
        cartList[index].id);

    update();
    cartList.refresh();
  }

  decrement(int index) {
    if (cartList[index].quantity! <= 1) {
      deleteCartItems(index);
      update();
    } else {
      cartList[index].quantity = cartList[index].quantity! - 1;
      updateCartQuntity(
          ItemsModel(
            id: cartList[index].id,
            title: cartList[index].title,
            desc: cartList[index].desc,
            quantity: cartList[index].quantity,
          ),
          cartList[index].id);

      update();
      cartList.refresh();
    }
  }
}
