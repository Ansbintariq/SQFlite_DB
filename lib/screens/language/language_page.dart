import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('eu', 'US'));
              },
              child: Text("En")),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('ur', 'PK'));
              },
              child: Text("Urdu"))
        ],
      ),
    );
  }
}
