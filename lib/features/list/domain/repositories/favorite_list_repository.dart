import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';

abstract class FavoriteListRepository {
  Future<Either<Failure, FavoriteListEntity>> getFavoriteLists();

  Future<Either<Failure, bool>> createFavoriteList(String title);

  Future<Either<Failure, bool>> deleteFavoriteList(String id);

  Future<Either<Failure, bool>> addContentToList(
    String listID,
    Content content,
  );

  Future<Either<Failure, bool>> removeContentFromList(
    String listID,
    Content content,
  );

  Future<Either<Failure, bool>> editListName({
    required String listID,
    required String newTitle,
  });
}
