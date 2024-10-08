import 'package:dio/dio.dart';
import '../models/movie_model.dart';

class MovieService {
  final _dio = Dio();

  Future<List<MovieModel>> fetchMovies() async {
    try {
      final response = await _dio.get('https://dummyapi.online/api/movies');
      List<MovieModel> movies = (response.data as List)
          .map((movieData) => MovieModel.fromJson(movieData))
          .toList();
      return movies;
    } catch (e) {
      throw Exception('Gagal Memuat');
    }
  }
}
