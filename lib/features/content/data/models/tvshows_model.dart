import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class TVShowsModel extends TVShowsEntity {
  final int id;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final DateTime firstAirDate;
  final String name;
  final String originalName;

  TVShowsModel({
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.originalName,
  }) : super(
          id: id,
          originalLanguage: originalLanguage,
          overview: overview,
          posterPath: posterPath,
          firstAirDate: firstAirDate,
          name: name,
          originalName: originalLanguage,
          type: ContentType.tv,
        );

  factory TVShowsModel.fromJson(Map<String, dynamic> json) {
    return TVShowsModel(
      id: json['id'],
      originalLanguage: json['original_language'] ?? "",
      originalName: json['original_name'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
      firstAirDate: DateTime.parse(json['first_air_date']),
      name: json['name'] ?? "",
    );
  }

  factory TVShowsModel.fromEntity(TVShowsEntity entity) {
    return TVShowsModel(
      id: entity.id,
      originalLanguage: entity.originalLanguage,
      originalName: entity.originalName,
      overview: entity.overview,
      posterPath: entity.posterPath,
      firstAirDate: entity.firstAirDate,
      name: entity.name,
    );
  }

  TVShowsEntity toEntity() => TVShowsEntity(
        id: id,
        originalLanguage: originalLanguage,
        overview: overview,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        name: name,
        originalName: originalName,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'original_language': originalLanguage,
        'overview': overview,
        'poster_path': posterPath,
        'first_air_date': firstAirDate.toIso8601String(),
        'name': name,
        'original_name': originalName,
      };

  @override
  bool operator ==(Object other) => other is TVShowsModel && other.id == id;

  @override
  int get hashCode => name.hashCode;
}
