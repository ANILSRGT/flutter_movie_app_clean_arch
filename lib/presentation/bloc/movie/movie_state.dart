part of 'movie_cubit.dart';

/// The state of the [MovieCubit]
sealed class MovieState extends BaseBlocState {
  /// [MovieState] constructor
  MovieState({
    this.popularMovies = const [],
    this.popularMoviesBackdropPaths = const {},
    this.popularMoviesPosterPaths = const {},
    this.popularMovieGenres = const {},
  });

  /// The list of popular movies.
  final List<MovieModel> popularMovies;

  /// The map of popular movies backdrop paths.
  /// <br>The key is the `movie id`.
  final Map<String, String?> popularMoviesBackdropPaths;

  /// The map of popular movies poster paths.
  /// <br>The key is the `movie id`.
  final Map<String, String?> popularMoviesPosterPaths;

  /// The map of popular movies genres.
  /// <br>The key is the `movie id`.
  final Map<String, Set<MovieGenreModel>> popularMovieGenres;

  @override
  List<Object> get props => [
        popularMovies,
        popularMoviesBackdropPaths,
        popularMoviesPosterPaths,
        popularMovieGenres,
      ];
}

/// The state of the movie cubit when initial
final class MovieInitial extends MovieState {}

/// The state of the movie cubit when the movies are loading
final class MovieLoading extends MovieState {}

/// The state of the movie cubit when error occurs
final class MovieError extends MovieState {
  /// [MovieError] constructor
  MovieError({
    required this.message,
  });

  /// The error message
  final String message;
}

/// The state of the movie cubit when the movies are loaded
final class MovieLoaded extends MovieState {
  /// [MovieLoaded] constructor
  MovieLoaded({
    required super.popularMovies,
    required super.popularMoviesBackdropPaths,
    required super.popularMoviesPosterPaths,
    required super.popularMovieGenres,
  });
}
