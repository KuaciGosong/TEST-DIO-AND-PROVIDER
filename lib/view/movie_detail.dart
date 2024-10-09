import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  MovieDetailPage({required this.movie});

  // Fungsi untuk membuka URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movie),
        backgroundColor: Color(0xFF006BFF), 
        foregroundColor: Colors.white, // Warna AppBar
      ),
      body: Container(
        color: Color(0xFFBCF2F6), // Warna background penuh
        padding: const EdgeInsets.all(16.0),
        child: Center( // Membungkus Column dengan Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur konten agar berada di tengah
            crossAxisAlignment: CrossAxisAlignment.center, // Rata tengah
            children: [
              Text(
                movie.movie,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 10),
              Text(
                'Rating: ${movie.rating}',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 20),
              Image.network(movie.image),
              SizedBox(height: 20),
              Text(
                'For more details, visit the movie on IMDb:',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _launchURL(movie.imdbUrl); // Buka link ke IMDb
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006BFF), // Warna background button
                  foregroundColor: Colors.white, // Warna teks button
                ),
                child: Text('Open IMDb'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
