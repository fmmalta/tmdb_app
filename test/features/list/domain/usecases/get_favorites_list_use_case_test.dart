import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/get_favorites_list_use_case.dart';
import 'favorite_list_use_case_test.mocks.dart';
import '../../core/favorite_list_entity_mock.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late FavoriteListRepository repository;
  late GetFavoritesListUseCase usecase;

  setUp(() {
    repository = MockFavoriteListRepository();
    usecase = GetFavoritesListUseCase(repository);
  });

  test('should get favorites list from the repository', () async {
    // arrange
    when(repository.getFavoriteLists())
        .thenAnswer((_) async => Right(tFavoriteList));
    // act
    final result = await usecase.call();
    // assert
    expect(result, Right(tFavoriteList));
    verify(repository.getFavoriteLists());
    verifyNoMoreInteractions(repository);
  });
}
