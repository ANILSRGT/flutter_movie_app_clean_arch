import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/widgets/movie/movie_card.dart';

/// [IntroductionMovieCard] is introduction movie card widget
/// [T] is id type
class IntroductionMovieCard<T> extends MovieCard<T> {
  /// [IntroductionMovieCard] constructor
  const IntroductionMovieCard({
    required super.id,
    required super.title,
    required super.image,
    required super.description,
    super.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MovieCard(
      id: id,
      onTap: onTap,
      image: image,
      title: title,
      description: description,
    );
  }
}
