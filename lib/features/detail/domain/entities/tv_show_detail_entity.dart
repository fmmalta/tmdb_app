import 'package:intl/intl.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class TVShowDetailEntity extends Content {
  final int id;
  final String backdropPath;
  final List<CreatedBy> createdBy;
  final DateTime firstAirDate;
  final List<Genre> genres;
  final String name;
  final List<Network> networks;
  final int numberOfSeasons;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final List<Season> seasons;
  final ContentType type;

  TVShowDetailEntity({
    required this.id,
    required this.backdropPath,
    required this.createdBy,
    required this.firstAirDate,
    required this.genres,
    required this.name,
    required this.networks,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.seasons,
    this.type = ContentType.tv,
  });
}

class Network {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        logoPath: json["logo_path"] ?? '',
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class Season {
  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate:
          json["air_date"] == null ? null : DateTime.tryParse(json["air_date"]),
      episodeCount: json["episode_count"] ?? 0,
      id: json["id"],
      name: json["name"],
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "air_date":
            airDate == null ? null : DateFormat("dd/MM/yyyy").format(airDate!),
        "episode_count": episodeCount,
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "season_number": seasonNumber,
        "vote_average": voteAverage,
      };
}
