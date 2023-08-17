import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/delete_favorite_list_use_case.dart';

import 'favorite_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late DeleteFavoriteListUseCase usecase;
  late MockFavoriteListRepository repository;

  setUp(() {
    repository = MockFavoriteListRepository();
    usecase = DeleteFavoriteListUseCase(repository);
  });

  test('should call repository with correct params', () async {
    // arrange
    const listId = '1';
    when(repository.deleteFavoriteList(listId))
        .thenAnswer((_) async => const Right(true));
    // act
    await usecase(listId);
    // assert
    verify(repository.deleteFavoriteList(listId));
  });
}
