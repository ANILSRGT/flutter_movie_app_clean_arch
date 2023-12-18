// ignore_for_file: public_member_api_docs
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

class MovieEntity extends BaseEntity {
  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
  });

  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        genreIds,
        voteAverage,
        voteCount,
      ];
}
