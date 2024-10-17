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
        backgroundColor: const Color.fromARGB(226, 244, 44, 4),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Top Rated Movies",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
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
            List<Movie> orderedMovies = snapshot.data!
              ..sort((a, b) {
                double aRating = a.imdbRating == "N/A" ? 0 : double.tryParse(a.imdbRating) ?? 0;
                double bRating = b.imdbRating == "N/A" ? 0 : double.tryParse(b.imdbRating) ?? 0;
                return bRating.compareTo(aRating);
              });
            List<Movie> filteredMovies = orderedMovies.where((movie) {
              return movie.title.toLowerCase().contains(searchText.toLowerCase());
            }).toList();

            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth ~/ 150;
                crossAxisCount = crossAxisCount.clamp(1, 3);
                
                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: filteredMovies[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}