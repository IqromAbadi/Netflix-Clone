import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut(() => HomeController());
  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
