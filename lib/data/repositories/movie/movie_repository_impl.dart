import 'package:core/core.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_local_data_source.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// [MovieRepositoryImpl] is the implementation of [MovieRepository]
class MovieRepositoryImpl extends MovieRepository {
  /// [MovieRepositoryImpl] constructor
  MovieRepositoryImpl(this.movieRemoteDataSource, this.movieLocalDataSource);

  /// [movieRemoteDataSource] instance of [MovieRemoteDataSource]
  final MovieRemoteDataSource movieRemoteDataSource;

  /// [movieLocalDataSource] instance of [MovieLocalDataSource]
  final MovieLocalDataSource movieLocalDataSource;

  @override
  Future<ResponseModel<List<MovieEntity>>> getPopularMovies() =>
      movieRemoteDataSource.getPopularMovies();

  @override
  Future<ResponseModel<List<MovieEntity>>> getTrendingMovies() =>
      movieRemoteDataSource.getTrendingMovies();

  @override
  Future<ResponseModel<List<MovieEntity>>> searchMovies(String query) =>
      movieRemoteDataSource.searchMovies(query);

  @override
  String getMoviePosterUrl(String moviePosterPath) =>
      movieRemoteDataSource.getMoviePosterUrl(moviePosterPath);

  @override
  String getMovieBackdropUrl(String movieBackdropPath) =>
      movieRemoteDataSource.getMovieBackdropUrl(movieBackdropPath);
}
