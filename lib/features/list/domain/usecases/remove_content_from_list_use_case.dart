import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class RemoveContentFromListUseCase {
  final FavoriteListRepository repository;

  RemoveContentFromListUseCase(this.repository);

  Future<Either<Failure, bool>> call(String listID, Content content) async {
    return await repository.removeContentFromList(listID, content);
  }
}
