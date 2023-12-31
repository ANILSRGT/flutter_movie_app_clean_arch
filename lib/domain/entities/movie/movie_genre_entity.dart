// ignore_for_file: public_member_api_docs
import 'package:core/core.dart';

class MovieGenreEntity extends BaseEntity {
  MovieGenreEntity({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
