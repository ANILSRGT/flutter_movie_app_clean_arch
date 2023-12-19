import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_genre_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_genre_model.g.dart';

/// Movie model class.
@JsonSerializable()
class MovieGenreModel extends MovieGenreEntity
    implements BaseModel<MovieGenreModel> {
  /// [MovieGenreModel] constructor.
  MovieGenreModel({
    super.id,
    super.name,
  });

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreModelFromJson(json);

  @override
  MovieGenreModel fromJson(Map<String, dynamic> json) =>
      MovieGenreModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieGenreModelToJson(this);

  @override
  MovieGenreModel copyWith({String? name}) {
    return MovieGenreModel(
      id: id,
      name: name ?? this.name,
    );
  }
}
