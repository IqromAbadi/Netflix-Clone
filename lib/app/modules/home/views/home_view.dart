import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/service/utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/netflix.png",
          width: 100,
          height: 50,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.topRated.isEmpty) {
                    return const Center(
                        child: Text('No Top Rated Movies Found',
                            style: TextStyle(color: Colors.white)));
                  } else {
                    return PageView.builder(
                      controller: controller.topRatedPageController,
                      itemCount: controller.topRated.length,
                      itemBuilder: (context, index) {
                        var tv = controller.topRated[index];
                        return Stack(
                          children: [
                            Image.network(
                              '$imageUrl${tv.backdropPath}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                    child:
                                        Icon(Icons.error, color: Colors.red));
                              },
                            ),
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: Text(
                                tv.originalTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.upcomingMovies.isEmpty) {
                    return const Center(
                        child: Text('No Upcoming Movies Found',
                            style: TextStyle(color: Colors.white)));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.upcomingMovies.length,
                      itemBuilder: (context, index) {
                        var movie = controller.upcomingMovies[index];
                        return Container(
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '$imageUrl${movie.posterPath}',
                                fit: BoxFit.cover,
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.nowplaying.isEmpty) {
                    return const Center(
                        child: Text('No Now Playing Movies Found',
                            style: TextStyle(color: Colors.white)));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.nowplaying.length,
                      itemBuilder: (context, index) {
                        var movie = controller.nowplaying[index];
                        return Container(
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '$imageUrl${movie.posterPath}',
                                fit: BoxFit.cover,
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
