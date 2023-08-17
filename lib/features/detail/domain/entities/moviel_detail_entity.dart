import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class MovieDetailEntity extends Content {
  final String backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final ContentType type;

  MovieDetailEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    this.type = ContentType.movie,
  });

  @override
  bool operator ==(Object other) =>
      other is MovieDetailEntity && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
