import 'dart:convert';

import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

TVShowDetailModel detailTvShowEntityFromJson(String str) =>
    TVShowDetailModel.fromJson(json.decode(str));

String detailTvShowEntityToJson(TVShowDetailModel data) =>
    json.encode(data.toJson());

class TVShowDetailModel {
  int? id;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  DateTime? firstAirDate;
  List<Genre>? genres;
  String? name;
  List<Network>? networks;
  int? numberOfSeasons;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  List<Season>? seasons;

  TVShowDetailModel({
    this.id,
    this.backdropPath,
    this.createdBy,
    this.firstAirDate,
    this.genres,
    this.name,
    this.networks,
    this.numberOfSeasons,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.seasons,
  });

  factory TVShowDetailModel.fromJson(Map<String, dynamic> json) {
    return TVShowDetailModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "",
      createdBy: json["created_by"] == null
          ? []
          : List<CreatedBy>.from(
              json["created_by"].map((x) => CreatedBy.fromJson(x))),
      firstAirDate: json["first_air_date"] == null
          ? null
          : DateTime.parse(json["first_air_date"]),
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      name: json["name"],
      networks: json["networks"] == null
          ? []
          : List<Network>.from(
              json["networks"].map((x) => Network.fromJson(x))),
      numberOfSeasons: json["number_of_seasons"] ?? 0,
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      seasons: json["seasons"] == null
          ? []
          : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "backdrop_path": backdropPath,
        "created_by": createdBy == null
            ? []
            : List<dynamic>.from(createdBy!.map((x) => x.toJson())),
        "first_air_date": firstAirDate == null
            ? DateTime.now()
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genres": genres == null
            ? []
            : List<Map<String, dynamic>>.from(genres!.map((x) => x.toJson())),
        "name": name,
        "networks": networks == null
            ? []
            : List<dynamic>.from(networks!.map((x) => x.toJson())),
        "number_of_seasons": numberOfSeasons,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "seasons": seasons == null
            ? []
            : List<Map<String, dynamic>>.from(seasons!.map((x) => x.toJson())),
      };

  String toEncode() => json.encode(toJson());

  TVShowDetailEntity toEntity() {
    return TVShowDetailEntity(
      id: id ?? 0,
      backdropPath: backdropPath ?? "",
      createdBy: createdBy ?? [],
      firstAirDate: firstAirDate ?? DateTime.now(),
      genres: genres ?? [],
      name: name ?? "",
      networks: networks ?? [],
      numberOfSeasons: numberOfSeasons ?? 0,
      originalLanguage: originalLanguage ?? "",
      originalName: originalName ?? "",
      overview: overview ?? "",
      posterPath: posterPath ?? "",
      seasons: seasons ?? [],
    );
  }

  factory TVShowDetailModel.fromEntity(TVShowDetailEntity entity) {
    return TVShowDetailModel(
      id: entity.id,
      backdropPath: entity.backdropPath,
      createdBy: entity.createdBy,
      firstAirDate: entity.firstAirDate,
      genres: entity.genres,
      name: entity.name,
      networks: entity.networks,
      numberOfSeasons: entity.numberOfSeasons,
      originalLanguage: entity.originalLanguage,
      originalName: entity.originalName,
      overview: entity.overview,
      posterPath: entity.posterPath,
      seasons: entity.seasons,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is TVShowDetailModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
