import 'package:flutter/material.dart';
import 'package:my_app_movies/screens/movie_details_page.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.poster, width: 35, height: 75, fit: BoxFit.cover),
      title: Text(movie.title),
      subtitle: Text(movie.genre),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailsPage(movie: movie)),
        );
      },
    );
  }
}
