import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/movie.dart';

class MovieService {
  Future<List<Movie>> fetchMovies() async {
    final String response = await rootBundle.loadString('assets/movies.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Movie.fromJson(json)).toList();
  }
}
