import 'package:intl/intl.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

abstract class Content with TVContentExtras {
  late String backdropPath;
  late List<Genre> genres;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late DateTime releaseDate;
  late String title;
  late String name;
  late ContentType type;

  String get date {
    return type == ContentType.movie
        ? DateFormat('dd/MM/yyyy').format(releaseDate)
        : DateFormat('dd/MM/yyyy').format(firstAirDate);
  }

  String get year {
    return type == ContentType.movie
        ? releaseDate.year.toString()
        : firstAirDate.year.toString();
  }

  String get label => type == ContentType.movie ? title : name;

  String get posterUrl => BASE_IMAGE_URL + posterPath;
}

mixin TVContentExtras {
  late List<Season> seasons;
  late DateTime firstAirDate;
  late List<CreatedBy> createdBy;
  late List<Network> networks;
  late int numberOfSeasons;
  late String originalName;
}

enum ContentType { movie, tv }

class Genre {
  final String name;

  Genre({required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {"name": name};
}

class CreatedBy {
  final String name;

  CreatedBy({required this.name});

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {"name": name};
}
