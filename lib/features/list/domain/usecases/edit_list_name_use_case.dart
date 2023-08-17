import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class EditListNameUseCase {
  final FavoriteListRepository repository;

  EditListNameUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String id,
    required String newTitle,
  }) async {
    return await repository.editListName(listID: id, newTitle: newTitle);
  }
}
