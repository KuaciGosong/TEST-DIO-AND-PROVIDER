import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart'; // Pastikan provider sudah diimport dengan benar
import '../view/movie_detail.dart'; // Ini untuk navigasi ke halaman detail

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();
    // Memuat daftar film ketika page dibuka
    Provider.of<MovieProvider>(context, listen: false).getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (movieProvider.movieList.isEmpty) {
            return Center(child: Text('No Movies Available'));
          }

          return ListView.builder(
            itemCount: movieProvider.movieList.length,
            itemBuilder: (context, index) {
              final movie = movieProvider.movieList[index];
              return ListTile(
                title: Text(movie.movie),
                subtitle: Text('Rating: ${movie.rating}'),
                onTap: () {
                  // Navigasi ke halaman detail ketika item diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(movie: movie),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
