import 'dart:convert';

import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';

class MovieDetailModel {
  String? backdropPath;
  List<Genre>? genres;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;

  MovieDetailModel({
    this.backdropPath,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        backdropPath: json["backdrop_path"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
      );

  factory MovieDetailModel.fromEntity(MovieDetailEntity entity) {
    return MovieDetailModel(
      backdropPath: entity.backdropPath,
      genres: entity.genres,
      id: entity.id,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      title: entity.title,
    );
  }

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
      };

  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      backdropPath: backdropPath ?? "",
      genres: genres ?? [],
      id: id ?? 0,
      originalLanguage: originalLanguage ?? "",
      originalTitle: originalTitle ?? "",
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      releaseDate: releaseDate ?? DateTime.now(),
      title: title ?? "",
    );
  }

  MovieDetailEntity detailMovieEntityFromJson(String str) =>
      MovieDetailModel.fromJson(json.decode(str)).toEntity();

  String detailMovieEntityToJson(MovieDetailModel data) =>
      json.encode(data.toJson());

  @override
  bool operator ==(Object other) => other is MovieDetailModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
