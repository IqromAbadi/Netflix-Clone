import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/new/views/new_view.dart';
import 'package:netflix_clone/app/modules/search_movie/views/search_movie_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/netflix.png",
          width: 100,
          height: 50,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
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
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("HIIIII"),
                ],
              ),
            ),
            SearchMovieView(),
            NewView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xff17E6B7),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Comunity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Certificate",
            ),
          ],
        ),
      ),
    );
  }
}
