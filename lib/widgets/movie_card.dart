import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.poster, width: 50, height: 75, fit: BoxFit.cover),
      title: Text(movie.title),
      subtitle: Text(movie.genre),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/movie',
          arguments: movie,
        );
      },
    );
  }
}
