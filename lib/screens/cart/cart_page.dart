import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  const Text("  cart page "),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              Container(
                height: 600,
                child: Obx(
                  () => ListView.builder(
                    itemCount: cartController.cartList.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(cartController
                                              .cartList[index].title ??
                                          ""),
                                      Text(
                                          cartController.cartList[index].desc ??
                                              ""),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      cartController.decrement(index);
                                    },
                                    icon: Icon(Icons.remove)),
                                Text(
                                    "${cartController.cartList[index].quantity}"),
                                IconButton(
                                    onPressed: () {
                                      cartController.increment(index);
                                    },
                                    icon: Icon(Icons.add)),
                                IconButton(
                                  onPressed: () {
                                    cartController.deleteCartItems(
                                        cartController.cartList[index].id!);
                                    cartController.getAllCartItems();
                                  },
                                  icon: const Icon(Icons.delete),
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
