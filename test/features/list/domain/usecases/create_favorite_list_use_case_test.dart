import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/create_favorite_list_use_case.dart';

import 'favorite_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late CreateFavoriteListUseCase usecase;
  late MockFavoriteListRepository repository;

  setUp(() {
    repository = MockFavoriteListRepository();
    usecase = CreateFavoriteListUseCase(repository);
  });

  test('should call repository with correct params', () async {
    // arrange
    const title = 'My Favorite List';

    // act
    await usecase(title);

    // assert
    verify(repository.createFavoriteList(title));
  });
}
