import 'package:flutter/material.dart';
import '../models/movie_model.dart'; 

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movie),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.movie,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${movie.rating}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Image.network(movie.image),
            SizedBox(height: 20),
            Text(
              'For more details, visit the movie on IMDb:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Buka link ke IMDb
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Open IMDb URL:\n${movie.imdbUrl}"),
                      );
                    });
              },
              child: Text(
                movie.imdbUrl,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
