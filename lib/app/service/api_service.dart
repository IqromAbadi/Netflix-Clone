import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/app/data/movie_model.dart';

const String apiKey = "476aab979c17374aebf78d8a76b109fa";
const String imageUrl = 'https://tmdb.org/t/p/w500';
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

  //Get Top Rated
  Future<List<Result>> getTopRatedMovies() async {
    try {
      final String endPoint = 'movie/top_rated';
      final String url = '$baseUrl$endPoint?api_key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['results'];
        List<Result> movie = it.map((e) => Result.fromJson(e)).toList();
        return movie;
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

// Get Search Movies
  Future<List<Result>> searchMovies(String searchText) async {
    try {
      final String endPoint =
          'search/movie?query=${Uri.encodeComponent(searchText)}&api_key=$apiKey';
      final String url = '$baseUrl$endPoint';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        Iterable it = decodedResponse['results'];
        List<Result> searchMovie = it.map((e) => Result.fromJson(e)).toList();
        return searchMovie;
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

// GET Populer Movies
  Future<List<Result>> getPopulerMovies() async {
    try {
      final String endPoint = 'movie/popular';
      final String url = '$baseUrl$endPoint?api_key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['results'];
        List<Result> movie = it.map((e) => Result.fromJson(e)).toList();
        return movie;
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
