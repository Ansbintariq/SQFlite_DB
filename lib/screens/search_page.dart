import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/controller/items_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final controller = Get.put(Itemscontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 140, 192, 127),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .9,
                child: TextField(
                  controller: controller.searchtextController,
                  onChanged: (value) {
                    controller.searchItemsByName(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Theme.of(context).colorScheme.onBackground,
                    filled: true,
                    hintText: "Search products",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                  child: Obx(
                () => controller.foundproduct.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.foundproduct.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text(controller.foundproduct[index].title!),
                          ),
                        ),
                      )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
