import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class GetFavoritesListUseCase {
  final FavoriteListRepository repository;

  GetFavoritesListUseCase(this.repository);

  Future<Either<Failure, FavoriteListEntity>> call() {
    return repository.getFavoriteLists();
  }
}
