import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/controller/image_picker_controller.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  ImagePickerController imageController = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Obx(() {
          return Center(
            child: Column(
              children: [
                CircleAvatar(
                    radius: 90,
                    backgroundImage: imageController.imagePath.isNotEmpty
                        ? FileImage(File(imageController.imagePath.toString()))
                        : null),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Color.fromARGB(158, 179, 232, 218),
                          barrierColor: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(.4),
                          // isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          elevation: 20,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 170,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon:
                                                  Icon(Icons.highlight_remove)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            imageController
                                                .getImageFromCamera();
                                          },
                                          icon: Icon(Icons.camera_alt)),
                                      IconButton(
                                          onPressed: () {
                                            imageController
                                                .getImageFromGallery();
                                          },
                                          icon: Icon(Icons.image)),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("Add Image"))
              ],
            ),
          );
        }),
      ),
    );
  }
}
