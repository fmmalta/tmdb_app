import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class TVShowsEntity extends Content {
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final DateTime firstAirDate;
  final String name;
  final ContentType type;

  TVShowsEntity({
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.originalName,
    this.type = ContentType.tv,
  });
}
