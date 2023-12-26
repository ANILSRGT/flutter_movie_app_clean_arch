import 'package:core/core.dart';
import 'package:flutter_movie_app/app/app_container.dart';
import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genre_by_id_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_backdrop_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_poster_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';

/// Movie Service
final class MovieService {
  /// Fetch Movies
  Future<ResponseModel<List<MovieModel>>> fetchMovies() async {
    final moviesRes =
        await AppContainer.read<GetPopularMoviesUseCase>().call(NoParams());

    if (moviesRes.isNotSuccessPositive) {
      return moviesRes.isFail
          ? moviesRes.asFail.convertTo<List<MovieModel>>()
          : moviesRes.asSuccessNegative.convertTo<List<MovieModel>>();
    }

    return moviesRes.asSuccessPositive.convertTo<List<MovieModel>>();
  }

  /// Get backdrop url's for movies
  /// <br>[movieBackdropPaths] -> (Map<String **`movieId`**, String **`path`**>)
  Future<Map<String, String?>> getBackdropUrls(
    Map<int, String?> movieBackdropPaths,
  ) async {
    final getMovieBackdropUrlUseCase =
        AppContainer.read<GetMovieBackdropUrlUseCase>();
    final moviesBackdropPaths = <String, String?>{};
    for (final movie in movieBackdropPaths.entries) {
      final movieId = movie.key.toString();
      if (moviesBackdropPaths.containsKey(movieId)) continue;
      final backdropPath = movie.value;
      if (backdropPath == null) {
        moviesBackdropPaths[movieId] = null;
        continue;
      }
      final backdropUrl = await getMovieBackdropUrlUseCase.call(backdropPath);
      moviesBackdropPaths[movieId] = backdropUrl;
    }

    return moviesBackdropPaths;
  }

  /// Get poster url's for movies
  /// <br>[moviePosterPaths] -> (Map<String **`movieId`**, String **`path`**>)
  Future<Map<String, String?>> getPosterUrls(
    Map<int, String?> moviePosterPaths,
  ) async {
    final getMoviePosterUrlUseCase =
        AppContainer.read<GetMoviePosterUrlUseCase>();
    final moviesPosterPaths = <String, String?>{};
    for (final movie in moviePosterPaths.entries) {
      final movieId = movie.key.toString();
      if (moviesPosterPaths.containsKey(movieId)) continue;
      final posterPath = movie.value;
      if (posterPath == null) {
        moviesPosterPaths[movieId] = null;
        continue;
      }
      final posterUrl = await getMoviePosterUrlUseCase.call(posterPath);
      moviesPosterPaths[movieId] = posterUrl;
    }

    return moviesPosterPaths;
  }

  /// Get movie genres
  /// <br>[movieGenresIds] -> (Map<String **`movieId`**,
  /// List<String?> **`genreIds`**>)
  Future<Map<String, Set<MovieGenreModel>>> getMovieGenres(
    Map<int, List<int>?> movieGenresIds,
  ) async {
    final getMovieGenreByIdUseCase =
        AppContainer.read<GetMovieGenreByIdUseCase>();
    final movieGenres = <String, Set<MovieGenreModel>>{};
    for (final movie in movieGenresIds.entries) {
      final movieId = movie.key.toString();
      final genreIds = movie.value;
      if (movieGenres.containsKey(movieId)) continue;
      if (genreIds == null || genreIds.isEmpty) {
        movieGenres[movieId] = <MovieGenreModel>{};
        continue;
      }
      final movieGenresData = <MovieGenreModel>{};
      for (final genreId in genreIds) {
        final genreRes = await getMovieGenreByIdUseCase.call(genreId);
        if (genreRes.isNotSuccessPositive) continue;
        final genre = genreRes.asSuccessPositive.data as MovieGenreModel;
        movieGenresData.add(genre);
      }
      movieGenres[movieId] = movieGenresData;
    }

    return movieGenres;
  }
}
