import 'package:movie_app/features/detail/domain/entities/content_interface.dart';

class FavoriteListEntity {
  List<FavoriteListItemEntity> listContent;

  FavoriteListEntity({
    this.listContent = const [
      FavoriteListItemEntity(listTitle: '', content: {}, uuid: '')
    ],
  });
}

class FavoriteListItemEntity {
  final String listTitle;
  final Set<Content> content;
  final String uuid;

  const FavoriteListItemEntity({
    required this.listTitle,
    required this.content,
    required this.uuid,
  });

  String get totalMovies {
    return content
        .where((element) => element.type == ContentType.movie)
        .length
        .toString();
  }

  String get totalTvShows {
    return content
        .where((element) => element.type == ContentType.tv)
        .length
        .toString();
  }

  @override
  bool operator ==(Object other) =>
      other is FavoriteListItemEntity && other.uuid == uuid;

  @override
  int get hashCode => uuid.hashCode;
}
