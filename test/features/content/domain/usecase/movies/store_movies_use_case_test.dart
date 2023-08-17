import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';
import 'package:movie_app/features/content/domain/usecases/movies/store_movies_use_case.dart';

import 'mocks/get_local_movies_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesLocalRepository>()])
void main() {
  late StoreMoviesUseCase usecase;
  late MockMoviesLocalRepository repository;

  setUp(() {
    repository = MockMoviesLocalRepository();
    usecase = StoreMoviesUseCase(repository);
  });

  final tMovieEntity = MovieEntity(
    id: 550,
    title: 'Fight Club',
    overview: 'You dont talk about Fight Club',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    releaseDate: DateTime.now(),
  );

  final tMovieEntity2 = MovieEntity(
    id: 551,
    title: 'Fight Club 2',
    overview: 'You dont talk about Fight Club 2',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    releaseDate: DateTime.now(),
  );

  test('should store the given movies', () async {
    // arrange
    final movies = [tMovieEntity, tMovieEntity2];
    when(repository.storeMovies(movies))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await usecase(movies);

    // assert
    expect(result, const Right(true));
    verify(repository.storeMovies(movies));
  });
}
