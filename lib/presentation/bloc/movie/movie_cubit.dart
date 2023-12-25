import 'package:core/core.dart';
import 'package:flutter_movie_app/app/app_container.dart';
import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genre_by_id_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_backdrop_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_poster_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';

part 'movie_state.dart';

/// The cubit that manages the state of the movies
final class MovieCubit extends BaseCubit<MovieState> {
  /// [MovieCubit] constructor
  MovieCubit() : super(initialState: MovieState());

  /// The method that fetches the movies
  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());

    final moviesRes =
        await AppContainer.read<GetPopularMoviesUseCase>().call(NoParams());

    if (moviesRes.isNotSuccessPositive) {
      emit(
        MovieError(
          message: moviesRes.isFail
              ? moviesRes.asFail.message
              : moviesRes.asSuccessNegative.message,
        ),
      );
    }

    final movies = moviesRes.asSuccessPositive.data as List<MovieModel>;

    final getMovieBackdropUrlUseCase =
        AppContainer.read<GetMovieBackdropUrlUseCase>();
    final moviesBackdropPaths = <String, String>{};
    for (final movie in movies) {
      final movieId = movie.id;
      if (movieId == null ||
          moviesBackdropPaths.containsKey(movieId.toString())) continue;
      final backdropPath = movie.backdropPath;
      if (backdropPath == null) continue;
      final backdropUrl = await getMovieBackdropUrlUseCase.call(backdropPath);
      moviesBackdropPaths[movieId.toString()] = backdropUrl;
    }

    final getMoviePosterUrlUseCase =
        AppContainer.read<GetMoviePosterUrlUseCase>();
    final moviesPosterPaths = <String, String>{};
    for (final movie in movies) {
      final movieId = movie.id;
      if (movieId == null ||
          moviesBackdropPaths.containsKey(movieId.toString())) continue;
      final posterPath = movie.posterPath;
      if (posterPath == null) continue;
      final posterUrl = await getMoviePosterUrlUseCase.call(posterPath);
      moviesPosterPaths[movieId.toString()] = posterUrl;
    }

    final getMovieGenreByIdUseCase =
        AppContainer.read<GetMovieGenreByIdUseCase>();
    final movieGenres = <String, Set<MovieGenreModel>>{};
    for (final movie in movies) {
      final genreIds = movie.genreIds;
      final movieId = movie.id;
      if (genreIds == null ||
          genreIds.isEmpty ||
          movieId == null ||
          movieGenres.containsKey(movieId.toString())) {
        continue;
      }
      final movieGenresData = <MovieGenreModel>{};
      for (final genreId in genreIds) {
        final genreRes = await getMovieGenreByIdUseCase.call(genreId);
        if (genreRes.isNotSuccessPositive) continue;
        final genre = genreRes.asSuccessPositive.data as MovieGenreModel;
        movieGenresData.add(genre);
      }
      movieGenres[movieId.toString()] = movieGenresData;
    }

    emit(
      state.copyWith(
        popularMovies: movies,
        popularMoviesBackdropPaths: moviesBackdropPaths,
        popularMoviesPosterPaths: moviesPosterPaths,
        popularMovieGenres: movieGenres,
      ),
    );
  }
}
