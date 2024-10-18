import 'package:get/get.dart';
import 'package:netflix_clone/app/data/movie_model.dart';
import 'package:netflix_clone/app/service/api_service.dart';

class SearchMovieController extends GetxController {
  final ApiService apiService = ApiService();
  RxList<Result> searchResults = <Result>[].obs;
  RxBool isLoading = false.obs;
  RxString query = ''.obs;

  void searchMovies(String searchText) async {
    if (searchText.isEmpty) {
      searchResults.clear();
      return;
    }

    isLoading.value = true;
    try {
      final results = await apiService.searchMovies(searchText);
      searchResults.value = _filterRelevantResults(results, searchText);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Result> _filterRelevantResults(List<Result> results, String query) {
    final queryLower = query.toLowerCase();

    bool matchesQuery(String? title, String query) {
      if (title == null) return false;
      final titleLower = title.toLowerCase();
      int queryIndex = 0;

      for (int i = 0; i < titleLower.length; i++) {
        if (titleLower[i] == queryLower[queryIndex]) {
          queryIndex++;
          if (queryIndex == queryLower.length) {
            return true;
          }
        }
      }
      return false;
    }

    return results.where((movie) {
      return matchesQuery(movie.title, queryLower);
    }).toList();
  }
}
