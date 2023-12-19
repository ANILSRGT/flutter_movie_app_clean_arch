import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_app/app/app_container.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';

part 'movie_state.dart';

/// The cubit that manages the state of the movies
final class MovieCubit extends BaseCubit<MovieState> {
  /// [MovieCubit] constructor
  MovieCubit() : super(initialState: MovieInitial());

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

    emit(
      MovieUpdated(
        movies: moviesRes.asSuccessPositive.data as List<MovieModel>,
      ),
    );
  }
}
