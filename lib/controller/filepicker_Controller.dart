import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FilePickerController extends GetxController {
  dynamic result;
  dynamic newFile;
  Future pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    final file = result!.files.first;
    print("Name:${file.name}");
    // print("Name:${file.size}");
    // print("Name:${file.extension}");
    // print("Name:${file.path}");
    newFile = await saveFilePermanently(file);
    print("path------:${newFile.path}");
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");

    return File(file.path!).copy(newFile.path);
  }

  openFile() => {};
}
