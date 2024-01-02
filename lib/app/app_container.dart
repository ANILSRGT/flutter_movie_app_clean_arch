import 'package:common/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_app/app/init/cache/caches/cache_manager.dart';
import 'package:flutter_movie_app/app/init/cache/caches/shared_preferences/shared_prefs_cache.dart';
import 'package:flutter_movie_app/app/init/navigation/app_router.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_local_data_source_impl.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/repositories/genre/movie_genre_repository_impl.dart';
import 'package:flutter_movie_app/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genre_by_id_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genres_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_backdrop_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_poster_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_trending_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/services/movie_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// Dependency injection container for the app
@immutable
final class AppContainer {
  static final _sl = GetIt.instance;

  /// Initialize the dependencies
  static Future<void> init() async {
    // Initialize for dependencies that require async initialization
    final cacheManager = CacheManager(SharedPrefsCache());
    await cacheManager.init();

    // Register your dependencies here
    final movieRemoteDataSourceImpl = MovieRemoteDataSourceImpl(http.Client());
    final movieLocalDataSourceImpl = MovieLocalDataSourceImpl(cacheManager);
    final movieGenreRemoteDataSourceImpl =
        MovieGenreRemoteDataSourceImpl(http.Client());
    final movieRepositoryImpl = MovieRepositoryImpl(
      movieRemoteDataSourceImpl,
      movieLocalDataSourceImpl,
    );
    final movieGenreRepositoryImpl =
        MovieGenreRepositoryImpl(movieGenreRemoteDataSourceImpl);
    final pBotToast = PBotToast();

    _sl
      //* <------------- Core -------------> //
      ..registerLazySingleton(AppRouter.new)
      //* <------------- Dependencies -------------> //
      ..registerLazySingleton(() => PToaster(pBotToast))
      //* <------------- Use cases -------------> //
      //~ Use cases (movie)
      ..registerLazySingleton(
        () => GetPopularMoviesUseCase(movieRepositoryImpl),
      )
      ..registerLazySingleton(
        () => GetTrendingMoviesUseCase(movieRepositoryImpl),
      )
      ..registerLazySingleton(
        () => GetMovieBackdropUrlUseCase(movieRepositoryImpl),
      )
      ..registerLazySingleton(
        () => GetMoviePosterUrlUseCase(movieRepositoryImpl),
      )
      //~ Use cases (genre)
      ..registerLazySingleton(
        () => GetMovieGenresUseCase(movieGenreRepositoryImpl),
      )
      ..registerLazySingleton(
        () => GetMovieGenreByIdUseCase(movieGenreRepositoryImpl),
      )
      //* <------------- Services -------------> //
      ..registerLazySingleton(MovieService.new);
  }

  /// Get an instance of a registered dependency
  static T read<T extends Object>() => _sl.get<T>();
}
