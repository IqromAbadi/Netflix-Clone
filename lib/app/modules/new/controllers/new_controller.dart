import 'package:get/get.dart';
import 'package:netflix_clone/app/data/movie_model.dart';
import 'package:netflix_clone/app/service/api_service.dart';

class NewController extends GetxController {
  var popularMovies = <Result>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPopularMovies();
    super.onInit();
  }

  void fetchPopularMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().getPopulerMovies();
      popularMovies.value = movies;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
