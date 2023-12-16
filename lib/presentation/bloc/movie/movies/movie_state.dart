part of 'movie_cubit.dart';

/// The state of the movie cubit
@immutable
sealed class MovieState extends BaseBlocState {
  MovieState({
    this.movies = const [],
  });

  /// The list of movies
  final List<MovieModel> movies;

  @override
  List<Object> get props => [
        movies,
      ];
}

/// The initial state of the movie cubit
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
final class MovieUpdated extends MovieState {
  /// [MovieUpdated] constructor
  MovieUpdated({
    required super.movies,
  });
}
