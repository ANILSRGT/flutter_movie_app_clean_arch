import 'package:common/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/repositories/genre/movie_genre_repository_impl.dart';
import 'package:flutter_movie_app/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genre_by_id_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genres_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_trending_movies_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// Dependency injection container for the app
@immutable
final class AppContainer {
  static final _sl = GetIt.instance;

  /// Initialize the dependencies
  static void init() {
    // Register your dependencies here
    _sl
      //* <------------- Core -------------> //
      ..registerLazySingleton(http.Client.new)
      ..registerLazySingleton(PBotToast.new)
      //* <------------- Data sources -------------> //
      ..registerLazySingleton(() => MovieRemoteDataSourceImpl(_sl()))
      ..registerLazySingleton(() => MovieGenreRemoteDataSourceImpl(_sl()))
      //* <------------- Repositories -------------> //
      ..registerLazySingleton(() => MovieRepositoryImpl(_sl()))
      ..registerLazySingleton(() => MovieGenreRepositoryImpl(_sl()))
      //* <------------- Use cases -------------> //
      //~ Use cases (movie)
      ..registerLazySingleton(() => GetPopularMoviesUseCase(_sl()))
      ..registerLazySingleton(() => GetTrendingMoviesUseCase(_sl()))
      //~ Use cases (genre)
      ..registerLazySingleton(() => GetMovieGenresUseCase(_sl()))
      ..registerLazySingleton(() => GetMovieGenreByIdUseCase(_sl()))
      //* <------------- Dependencies -------------> //
      ..registerLazySingleton(() => PToaster(_sl()));
  }

  /// Get an instance of a registered dependency
  static T read<T extends Object>() => _sl.get<T>();
}
