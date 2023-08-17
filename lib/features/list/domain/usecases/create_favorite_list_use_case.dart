import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class CreateFavoriteListUseCase {
  final FavoriteListRepository repository;

  CreateFavoriteListUseCase(this.repository);

  Future<Either<Failure, bool>> call(String title) {
    return repository.createFavoriteList(title);
  }
}
