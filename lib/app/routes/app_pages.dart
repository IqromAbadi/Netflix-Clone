import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new/bindings/new_binding.dart';
import '../modules/new/views/new_view.dart';
import '../modules/search_movie/bindings/search_movie_binding.dart';
import '../modules/search_movie/views/search_movie_view.dart';
import '../modules/splash_screens/bindings/splash_screens_binding.dart';
import '../modules/splash_screens/views/splash_screens_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREENS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREENS,
      page: () => const SplashScreensView(),
      binding: SplashScreensBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_MOVIE,
      page: () => const SearchMovieView(),
      binding: SearchMovieBinding(),
    ),
    GetPage(
      name: _Paths.NEW,
      page: () => const NewView(),
      binding: NewBinding(),
    ),
  ];
}
