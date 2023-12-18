import 'package:core/core.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';

/// Movie remote data source abstract class.
abstract class MovieRemoteDataSource {
  /// Get trending movies.
  /// <br/>Returns a list of [MovieModel] wrapped with [ResponseModelSuccessPositive]
  /// if the request is successful.
  /// <br/>Returns a [ResponseModelSuccessNegative] if the request is successful (no data)
  /// <br/>Returns a [ResponseModelFail] if the request is unsuccessful.
  Future<ResponseModel<List<MovieModel>>> getTrendingMovies();

  /// Get popular movies.
  /// <br/>Returns a list of [MovieModel] wrapped with [ResponseModelSuccessPositive]
  /// if the request is successful.
  /// <br/>Returns a [ResponseModelSuccessNegative] if the request is successful (no data)
  /// <br/>Returns a [ResponseModelFail] if the request is unsuccessful.
  Future<ResponseModel<List<MovieModel>>> getPopularMovies();

  /// Get movies with query.
  /// <br/>Returns a list of [MovieModel] wrapped with [ResponseModelSuccessPositive]
  /// if the request is successful.
  /// <br/>Returns a [ResponseModelSuccessNegative] if the request is successful (no data)
  /// <br/>Returns a [ResponseModelFail] if the request is unsuccessful.
  Future<ResponseModel<List<MovieModel>>> searchMovies(String query);

  /// Get movie poster url.
  /// <br/>Returns a [String] of movie poster url.
  String getMoviePosterUrl(String moviePosterPath);

  /// Get movie backdrop url.
  /// <br/>Returns a [String] of movie backdrop url.
  String getMovieBackdropUrl(String movieBackdropPath);
}
