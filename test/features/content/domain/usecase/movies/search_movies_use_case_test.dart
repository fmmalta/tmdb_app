import 'package:mockito/annotations.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/content/domain/usecases/movies/search_movies_use_case.dart';

import 'mocks/search_movies_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRemoteRepository>()])
void main() {
  late MoviesRemoteRepository repository;
  late SearchMoviesUseCase useCase;

  setUp(() {
    repository = MockMoviesRemoteRepository();
    useCase = SearchMoviesUseCase(repository);
  });

  test('should call repository with correct params', () async {
    // arrange
    const query = 'test';

    // act
    await useCase(query);

    // assert
    verify(repository.searchMovies(query));
  });
}
