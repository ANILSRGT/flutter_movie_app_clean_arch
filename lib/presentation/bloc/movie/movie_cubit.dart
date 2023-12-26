import 'package:core/core.dart';
import 'package:flutter_movie_app/app/app_container.dart';
import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';
import 'package:flutter_movie_app/presentation/services/movie_service.dart';

part 'movie_state.dart';

/// The cubit that manages the state of the movies
final class MovieCubit extends BaseCubit<MovieState> {
  /// [MovieCubit] constructor
  MovieCubit() : super(initialState: MovieInitial());

  /// The method that fetches the movies
  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());

    final movieService = AppContainer.read<MovieService>();

    // Fetch the movies
    final moviesRes = await movieService.fetchMovies();

    if (moviesRes.isNotSuccessPositive) {
      emit(
        MovieError(
          message: moviesRes.isFail
              ? moviesRes.asFail.message
              : moviesRes.asSuccessNegative.message,
        ),
      );
    }

    final movies = moviesRes.asSuccessPositive.data;

    final toBackdropPaths = movies
        .where((element) => element.id != null)
        .map((e) => MapEntry(e.id!, e.backdropPath));
    final toBackdropPathsMap = Map<int, String?>.fromEntries(toBackdropPaths);
    final moviesBackdropPaths =
        await movieService.getBackdropUrls(toBackdropPathsMap);

    final toPosterPaths = movies
        .where((element) => element.id != null)
        .map((e) => MapEntry(e.id!, e.posterPath));
    final toPosterPathsMap = Map<int, String?>.fromEntries(toPosterPaths);
    final moviesPosterPaths =
        await movieService.getPosterUrls(toPosterPathsMap);

    final toGenresIds = movies
        .where((element) => element.id != null)
        .map((e) => MapEntry(e.id!, e.genreIds));
    final toGenresIdsMap = Map<int, List<int>?>.fromEntries(toGenresIds);
    final movieGenres = await movieService.getMovieGenres(toGenresIdsMap);

    emit(
      MovieLoaded(
        popularMovies: movies,
        popularMoviesBackdropPaths: moviesBackdropPaths,
        popularMoviesPosterPaths: moviesPosterPaths,
        popularMovieGenres: movieGenres,
      ),
    );
  }
}
