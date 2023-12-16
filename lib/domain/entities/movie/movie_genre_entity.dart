// ignore_for_file: public_member_api_docs
import 'package:flutter_movie_app/core/base/base_entity.dart';

class MovieGenreEntity extends BaseEntity {
  MovieGenreEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
