import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/app/models/movie_model.dart';

const String apiKey = "476aab979c17374aebf78d8a76b109fa";
const String imageUrl = 'https://tmdb.org/t/p/w600';
const String baseUrl = 'https://api.themoviedb.org/3/';

class ApiService {
  //GET Upcoming Movies
  Future<List<Result>> getUpcomingMovies() async {
    try {
      final String endPoint = 'movie/upcoming';
      final String url = '$baseUrl$endPoint?api_key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['results'];
        List<Result> movies = it.map((e) => Result.fromJson(e)).toList();
        return movies;
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  //Get Now Playing
  Future<List<Result>> getNowPlayingMovies() async {
    try {
      final String endPoint = 'movie/now_playing';
      final String url = '$baseUrl$endPoint?api_key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['results'];
        List<Result> movies = it.map((e) => Result.fromJson(e)).toList();
        return movies;
      } else {
        throw Exception('Failed to load now playing movies');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
