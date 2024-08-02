import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_movie_controller.dart';

class SearchMovieView extends GetView<SearchMovieController> {
  const SearchMovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchMovieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchMovieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
