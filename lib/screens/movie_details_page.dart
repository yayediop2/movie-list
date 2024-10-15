import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsPage extends StatelessWidget {
      const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(movie.poster),
              const SizedBox (height: 10),
              Text(
                'Released: ${movie.released}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Genre: ${movie.genre}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Director: ${movie.director}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Actors: ${movie.actors}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Plot: ${movie.plot}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Language: ${movie.language}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Country: ${movie.country}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'Awards: ${movie.awards}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              Text(
                'IMDB Rating: ${movie.imdbRating}',
                style: const TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 20),
              const Text(
                'Additional Images:',
                style: TextStyle (fontSize: 18),
              ),
              const SizedBox (height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movie.images
                      .map((imageUrl) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(
                              imageUrl,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
