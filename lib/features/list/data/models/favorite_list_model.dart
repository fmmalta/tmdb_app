import 'dart:convert';

import 'package:movie_app/features/content/data/models/movie_model.dart';
import 'package:movie_app/features/content/data/models/tvshows_model.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:uuid/uuid.dart';

class FavoriteListModel {
  final List<FavoriteListItemModel> listContent;

  FavoriteListModel(this.listContent);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'listContent': listContent.map((dynamic x) => x.toJson()).toList(),
    };
  }

  factory FavoriteListModel.fromJson(Map<String, dynamic> json) {
    return FavoriteListModel(
      List.from(
        (json['listContent'] as List<dynamic>).map(
          (x) => FavoriteListItemModel.fromJson(x),
        ),
      ),
    );
  }

  String encode() => json.encode(toJson());

  @override
  bool operator ==(Object other) =>
      other is FavoriteListModel && other.hashCode == hashCode;

  @override
  int get hashCode => 'FavoriteListModel'.hashCode;
}

class FavoriteListItemModel {
  String listTitle;
  Set<Content>? content = <Content>{};
  String? id;

  FavoriteListItemModel({
    required this.listTitle,
    this.content,
    this.id,
  });

  FavoriteListItemEntity toEntity() {
    return FavoriteListItemEntity(
      listTitle: listTitle,
      content: content ?? <Content>{},
      uuid: id ?? const Uuid().v4(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'listTitle': listTitle,
      'content': content!.map((Content x) {
        if (x.type == ContentType.movie) {
          return MovieModel(
            id: x.id,
            originalLanguage: x.originalLanguage,
            overview: x.overview,
            posterPath: x.posterPath,
            releaseDate: x.releaseDate,
            title: x.title,
          ).toJson();
        } else if (x.type == ContentType.tv) {
          return TVShowsModel(
            id: x.id,
            originalLanguage: x.originalLanguage,
            overview: x.overview,
            posterPath: x.posterPath,
            firstAirDate: x.firstAirDate,
            name: x.name,
            originalName: x.originalName,
          ).toJson();
        }
      }).toList(),
      'id': id,
    };
  }

  factory FavoriteListItemModel.fromJson(Map<String, dynamic> map) {
    return FavoriteListItemModel(
      listTitle: map['listTitle'],
      content: Set<Content>.from(
        (map['content'] as List<dynamic>).map(
          (x) {
            try {
              return TVShowsModel.fromJson(x as Map<String, dynamic>);
            } catch (_) {
              return MovieModel.fromJson(x as Map<String, dynamic>);
            }
          },
        ),
      ),
      id: map['id'],
    );
  }

  String encode() => json.encode(toJson());

  @override
  bool operator ==(Object other) =>
      other is FavoriteListItemModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
