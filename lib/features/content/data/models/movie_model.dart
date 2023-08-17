import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';

class MovieModel extends MovieEntity {
  final int id;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final String title;

  MovieModel({
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  }) : super(
          id: id,
          originalLanguage: originalLanguage,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          type: ContentType.movie,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] == null || json['release_date'] == ''
          ? DateTime.now()
          : DateTime.parse(json['release_date']),
      title: json['title'] ?? '',
    );
  }

  factory MovieModel.fromEntity(MovieEntity entity) => MovieModel(
        id: entity.id,
        originalLanguage: entity.originalLanguage,
        overview: entity.overview,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        title: entity.title,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_language': originalLanguage,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate.toIso8601String(),
      'title': title,
    };
  }

  MovieEntity toEntity() => MovieEntity(
        id: id,
        originalLanguage: originalLanguage,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
      );

  @override
  bool operator ==(Object other) => other is MovieModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
