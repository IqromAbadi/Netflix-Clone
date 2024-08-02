import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/models/movie_model.dart';
import 'package:netflix_clone/app/service/api_service.dart';

class HomeController extends GetxController {
  var upcomingMovies = <Result>[].obs;
  var nowplaying = <Result>[].obs;
  var topRated = <Result>[].obs;
  var isLoading = true.obs;

  final PageController topRatedPageController =
      PageController(viewportFraction: 1);
  Timer? pageTimer;

  void fetchUpcomingMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().getUpcomingMovies();
      upcomingMovies.value = movies;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchNowPlayingMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().getNowPlayingMovies();
      nowplaying.value = movies;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchTopRatedMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().getTopRatedMovies();
      topRated.value = movies;
      startAutoScroll();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void startAutoScroll() {
    if (topRated.isNotEmpty) {
      pageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (topRatedPageController.hasClients) {
          final page = (topRatedPageController.page ?? 0) + 1;
          if (page >= topRated.length) {
            topRatedPageController.jumpToPage(0);
          } else {
            topRatedPageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      });
    }
  }

  @override
  void onClose() {
    pageTimer?.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    fetchNowPlayingMovies();
    fetchUpcomingMovies();
    fetchTopRatedMovies();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
