import 'package:flutter_movie_app/core/model/response_model.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';

/// [MovieRepository] is an abstract class that defines the methods that any
/// concrete implementation of [MovieRepository] must implement.
abstract class MovieRepository {
  /// Fetches the trending movies.
  Future<ResponseModel<List<MovieEntity>>> getTrendingMovies();

  /// Fetches the movies that matches the query.
  Future<ResponseModel<List<MovieEntity>>> searchMovies(String query);

  /// Fetches the popular movies.
  Future<ResponseModel<List<MovieEntity>>> getPopularMovies();

  /// Fetches the movie poster url.
  String getMoviePosterUrl(String moviePosterPath);

  /// Fetches the movie backdrop url.
  String getMovieBackdropUrl(String movieBackdropPath);
}
