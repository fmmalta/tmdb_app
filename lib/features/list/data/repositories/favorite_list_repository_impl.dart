import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/data/datasources/favorite_list_data_source.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class FavoriteListRepositoryImpl implements FavoriteListRepository {
  final FavoriteListDataSource dataSource;

  FavoriteListRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, bool>> createFavoriteList(String title) async {
    try {
      final createdList = await dataSource.createFavoriteList(title);
      return Right(createdList);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteList(String id) async {
    try {
      final isDeleted = await dataSource.deleteFavoriteList(id);
      return Right(isDeleted);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, FavoriteListEntity>> getFavoriteLists() async {
    try {
      final favoriteLists = await dataSource.getFavoriteList();
      return Right(favoriteLists);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> addContentToList(
    String listID,
    Content content,
  ) async {
    try {
      final isAdded = await dataSource.addContentToList(listID, content);
      return Right(isAdded);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> removeContentFromList(
    String listID,
    Content content,
  ) async {
    try {
      final isRemoved = await dataSource.removeContentFromList(listID, content);
      return Right(isRemoved);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> editListName({
    required String listID,
    required String newTitle,
  }) async {
    try {
      final isEdited = await dataSource.editListName(
        listID: listID,
        newTitle: newTitle,
      );
      return Right(isEdited);
    } catch (error) {
      rethrow;
    }
  }
}
