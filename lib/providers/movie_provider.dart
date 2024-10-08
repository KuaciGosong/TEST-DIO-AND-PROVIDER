import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  MovieService service = MovieService();
  List<MovieModel> _movieList = [];
  List<MovieModel> get movieList => _movieList;
  bool isLoading = false;

  Future<void> getMovieList() async {
    isLoading = true;
    notifyListeners();

    try {
      _movieList = await service.fetchMovies();
    } catch (e) {
      print('Gagal Memuat');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
