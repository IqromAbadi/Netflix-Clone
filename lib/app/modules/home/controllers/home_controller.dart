import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/home/views/home_view.dart';
import 'package:netflix_clone/app/modules/new/views/new_view.dart';
import 'package:netflix_clone/app/modules/search_movie/views/search_movie_view.dart';

class HomeController extends GetxController {
  final selectedValueIndex = 0.obs;
  final currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    SearchMovieView(),
    NewView(),
  ];

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
