part of 'movie_genre_cubit.dart';

/// The state of the movie cubit
@immutable
sealed class MovieGenreState extends BaseBlocState {
  MovieGenreState({
    this.movieGenres = const [],
  });

  /// The list of movies
  final List<MovieGenreModel> movieGenres;

  @override
  List<Object> get props => [
        movieGenres,
      ];
}

/// The initial state of the movie cubit
final class MovieGenreInitial extends MovieGenreState {}

/// The state of the movie cubit when the movies are loading
final class MovieGenreLoading extends MovieGenreState {}

/// The state of the movie cubit when error occurs
final class MovieGenreError extends MovieGenreState {
  /// [MovieGenreError] constructor
  MovieGenreError({
    required this.message,
  });

  /// The error message
  final String message;
}

/// The state of the movie cubit when the movies are loaded
final class MovieGenreUpdated extends MovieGenreState {
  /// [MovieGenreUpdated] constructor
  MovieGenreUpdated({
    required super.movieGenres,
  });
}
