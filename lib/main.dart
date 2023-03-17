import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/controller/language_controller.dart';
import 'package:sqflite_crud/screens/add_data.dart';
import 'package:sqflite_crud/screens/image_picker/file_picker_page.dart';
import 'package:sqflite_crud/screens/image_picker/image_picker_page.dart';
import 'package:sqflite_crud/screens/language/language_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' Demo',
      debugShowCheckedModeBanner: false,
      locale: Locale("en", "US"),
      translations: Language(),
      fallbackLocale: Locale("en", "US"),
      home: LanguagePage(),
    );
  }
}
