import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../widgets/movie_card.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movies;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    movies = MovieService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
        actions: [
          SearchBarWidget(onTextChanged: (text) {
            setState(() {
              searchText = text;
            });
          }),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading movies'));
          } else {
            List<Movie> filteredMovies = snapshot.data!.where((movie) {
              return movie.title.toLowerCase().contains(searchText.toLowerCase());
            }).toList();

            return ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: filteredMovies[index]);
              },
            );
          }
        },
      ),
    );
  }
}
