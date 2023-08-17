import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

class AddContentToListUseCase {
  final FavoriteListRepository repository;

  AddContentToListUseCase(this.repository);

  Future<Either<Failure, bool>> call(String listID, Content content) {
    return repository.addContentToList(listID, content);
  }
}
