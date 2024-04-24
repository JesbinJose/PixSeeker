import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixseeker/controller/images.dart';
import 'package:pixseeker/keys.dart';
import 'package:pixseeker/view/home.dart';
import 'package:pixseeker/view/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PixabayController(pixabayApiKey));
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: PixabayView(),
    );
  }
}
