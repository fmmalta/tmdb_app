import 'package:movie_app/features/detail/domain/entities/content_interface.dart';

class MovieEntity extends Content {
  final int id;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final ContentType type;

  MovieEntity({
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    this.type = ContentType.movie,
  });

  @override
  bool operator ==(Object other) => other is MovieEntity && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
