import 'package:get/get.dart';
import 'package:netflix_clone/app/models/movie_model.dart';
import 'package:netflix_clone/app/service/api_service.dart';

class HomeController extends GetxController {
  var upcomingMovies = <Result>[].obs;
  var nowplaying = <Result>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
  }

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
}
