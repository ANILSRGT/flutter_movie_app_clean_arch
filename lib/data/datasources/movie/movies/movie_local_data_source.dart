import 'package:flutter_movie_app/data/models/movie/movie_model.dart';

/// Movie local data source abstract class.
abstract class MovieLocalDataSource {
  /// Get trending movies.
  Future<List<MovieModel>> getTrendingMovies();

  /// Get popular movies.
  Future<List<MovieModel>> getPopularMovies();
}
