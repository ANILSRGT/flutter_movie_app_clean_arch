import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

/// Movie model class.
@JsonSerializable()
class MovieModel extends MovieEntity implements BaseModel<MovieModel> {
  /// [MovieModel] constructor.
  MovieModel({
    super.id,
    super.title,
    super.overview,
    super.posterPath,
    super.backdropPath,
    super.genreIds,
    super.voteAverage,
    super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  @override
  MovieModel fromJson(Map<String, dynamic> json) => MovieModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  MovieModel copyWith({
    String? title,
    String? overview,
    String? posterPath,
    String? backdropPath,
    List<int> Function(List<int>)? genreIds,
    int? addVote,
  }) {
    if (addVote != null && (addVote < 0 || addVote > 10)) {
      throw ArgumentError('addVote must be between 0 and 10');
    }
    return MovieModel(
      id: id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds?.call(this.genreIds ?? []) ?? this.genreIds,
      voteAverage: addVote == null
          ? voteAverage
          : ((voteAverage ?? 0) * (voteCount ?? 0) + addVote) /
              ((voteCount ?? 0) + 1),
      voteCount: (voteCount ?? 0) + 1,
    );
  }
}
