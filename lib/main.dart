import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/home/controllers/home_controller.dart';
import 'package:netflix_clone/app/modules/new/controllers/new_controller.dart';
import 'package:netflix_clone/app/modules/search_movie/controllers/search_movie_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => SearchMovieController());
  Get.lazyPut(() => NewController());
  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
