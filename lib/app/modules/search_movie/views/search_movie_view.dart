import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/search_movie/controllers/search_movie_controller.dart';

class SearchMovieView extends GetView<SearchMovieController> {
  const SearchMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: 'Search',
              placeholderStyle: const TextStyle(color: Colors.white),
              style: const TextStyle(color: Colors.white),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              onChanged: (value) {
                controller.query.value = value;
                controller.searchMovies(value);
              },
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.white));
              }

              if (controller.searchResults.isEmpty &&
                  !controller.isLoading.value) {
                return Center(
                    child: Text('No results found',
                        style: TextStyle(color: Colors.white)));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    final movie = controller.searchResults[index];
                    return ListTile(
                      leading: movie.posterPath != null
                          ? Image.network(
                              'https://tmdb.org/t/p/w500${movie.posterPath!}')
                          : SizedBox.shrink(),
                      title: Text(movie.title,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(movie.releaseDate.year.toString(),
                          style: TextStyle(color: Colors.white70)),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
