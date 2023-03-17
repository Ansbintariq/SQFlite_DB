import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite_crud/controller/filepicker_Controller.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({super.key});

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  FilePickerController filePickerController = Get.put(FilePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    filePickerController.pickFile();
                  },
                  child: Text("pick file")),
            ),
            // Image.file(File(filePickerController.newFile.toString())),

            IconButton(
                onPressed: () async {
                  PermissionStatus camera = await Permission.camera.request();
                },
                icon: Icon(Icons.camera))
          ],
        ),
      ),
    );
  }
}
