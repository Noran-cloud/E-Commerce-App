import 'package:flutter/material.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/movies.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
    final userService = locator<UserService>();

  Movies? movies; // nullable now
  bool isLoading = true;

  void getMoviesFromServer() async {
    try {
      final fetchedMovies = await userService.getMovies();
      setState(() {
        movies = fetchedMovies;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching movies: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getMoviesFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Movies 🎬',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : movies == null || movies!.description == null
              ? const Center(child: Text("No movies available"))
              : ListView.builder(
                  itemCount: movies!.description!.length,
                  itemBuilder: (context, index) {
                    var movie = movies!.description![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            movie.imgPoster ?? '',
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 100),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title ?? 'No Title',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  movie.actors ?? 'Unknown Actors',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.download),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
