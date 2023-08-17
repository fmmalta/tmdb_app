import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/edit_list_name_use_case.dart';

import 'favorite_list_use_case_test.mocks.dart';
import '../../core/favorite_list_entity_mock.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late FavoriteListRepository repository;
  late EditListNameUseCase usecase;

  setUp(() {
    repository = MockFavoriteListRepository();
    usecase = EditListNameUseCase(repository);
  });

  const tNewTitle = 'New Title';

  test('should call repository with correct params', () async {
    // arrange
    when(repository.editListName(
      listID: tFavoriteList.listContent.first.uuid,
      newTitle: tNewTitle,
    )).thenAnswer((_) async => const Right(true));
    // act
    await usecase(
      id: tFavoriteList.listContent.first.uuid,
      newTitle: tNewTitle,
    );
    // assert
    verify(
      repository.editListName(
        listID: tFavoriteList.listContent.first.uuid,
        newTitle: tNewTitle,
      ),
    ).called(1);
  });

  test('should return Right(true) when repository returns Right(true)',
      () async {
    // arrange
    when(repository.editListName(
      listID: tFavoriteList.listContent.first.uuid,
      newTitle: tNewTitle,
    )).thenAnswer((_) async => const Right(true));
    // act
    final result = await usecase(
      id: tFavoriteList.listContent.first.uuid,
      newTitle: tNewTitle,
    );
    // assert
    expect(result, const Right(true));
  });

  test('should return Left(Failure) when repository returns Left(Failure)',
      () async {
    // arrange
    when(repository.editListName(
      listID: tFavoriteList.listContent.first.uuid,
      newTitle: tNewTitle,
    )).thenThrow(Exception());
    // act
    // assert
    expect(
      () => usecase(
        id: tFavoriteList.listContent.first.uuid,
        newTitle: tNewTitle,
      ),
      throwsException,
    );
  });
}
