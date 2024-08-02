import 'package:flutter/material.dart';
import 'package:netflix_clone/app/modules/home/views/home_view.dart';
import 'package:netflix_clone/app/modules/new/views/new_view.dart';
import 'package:netflix_clone/app/modules/search_movie/views/search_movie_view.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    SearchMovieView(),
    NewView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_outlined),
            label: 'New',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }
}
