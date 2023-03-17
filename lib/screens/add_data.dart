import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/controller/cart_controller.dart';
import 'package:sqflite_crud/controller/items_controller.dart';
import 'package:sqflite_crud/screens/cart/cart_page.dart';
import 'package:sqflite_crud/screens/search_page.dart';

import '../model/items_model.dart';

class AddData extends StatefulWidget {
  AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final controller = Get.put(Itemscontroller());

  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.getAllCartItems();
    controller.getItemsToDb();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 114, 204, 164),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GetBuilder(
                      init: CartController(),
                      builder: (value) => InkWell(
                            child: IconButton(
                              onPressed: () {
                                Get.to(() => CartPage());
                              },
                              icon: Badge.count(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                textColor:
                                    Theme.of(context).colorScheme.outline,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                smallSize: 2,
                                count: value.cartList.length,
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30,
                                ),
                              ),
                            ),
                          )),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      hintText: 'Enter valid title '),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: controller.descController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      hintText: 'Enter your  Description'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // you can also pass these in controller
                    controller.addToDb(ItemsModel(
                      // id: 0,
                      title: controller.titleController.text,
                      desc: controller.descController.text,
                      quantity: 1,
                    ));
                    controller.getItemsToDb();
                  },
                  child: const Text("Add")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SearchPage());
                  },
                  child: Text("search")),
              Container(
                height: 400,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.itemsList.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.itemsList[index].title ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        controller.itemsList[index].desc ?? ""),
                                  ],
                                )),
                                IconButton(
                                    onPressed: () {
                                      cartController.addCartToDb(ItemsModel(
                                        title:
                                            controller.itemsList[index].title,
                                        desc: controller.itemsList[index].desc,
                                        quantity: controller
                                            .itemsList[index].quantity,
                                      ));
                                    },
                                    icon: Icon(Icons.shopping_cart_checkout)),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteItemsDb(
                                        controller.itemsList[index].id!);
                                    controller.getItemsToDb();
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //for edit value to display in update form feilds
                                    controller.editTitleController.text =
                                        controller.itemsList[index].title!;
                                    controller.editDescController.text =
                                        controller.itemsList[index].desc!;
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            child: AlertDialog(
                                              title: const Text("Update"),
                                              actions: [
                                                TextField(
                                                  controller: controller
                                                      .editTitleController,
                                                  decoration: InputDecoration(),
                                                ),
                                                TextField(
                                                  controller: controller
                                                      .editDescController,
                                                  decoration: InputDecoration(),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    controller.updateItemsDb(
                                                        ItemsModel(
                                                          // id: 0,
                                                          title: controller
                                                              .editTitleController
                                                              .text,
                                                          desc: controller
                                                              .editDescController
                                                              .text,
                                                        ),
                                                        controller
                                                            .itemsList[index]
                                                            .id);
                                                    controller.getItemsToDb();
                                                  },
                                                  child: Text("Update"),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                    controller.getItemsToDb();
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
