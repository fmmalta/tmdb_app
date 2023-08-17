import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';

import 'package:movie_app/features/content/domain/usecases/movies/get_local_movies_use_case.dart';

import 'mocks/get_local_movies_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesLocalRepository>()])
void main() {
  late MoviesLocalRepository repository;
  late GetLocalMoviesUseCase usecase;

  setUp(() {
    repository = MockMoviesLocalRepository();
    usecase = GetLocalMoviesUseCase(repository);
  });

  final tMovieEntity = MovieEntity(
    id: 550,
    title: 'Fight Club',
    overview: 'You dont talk about Fight Club',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    releaseDate: DateTime.now(),
  );

  group('GetLocalMoviesUseCase', () {
    test('should store movies locally', () async {
      // arrange
      final movies = [tMovieEntity];
      when(repository.storeMovies(movies))
          .thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase.storeMoviesLocally(movies);

      // assert
      expect(result, const Right(true));
      verify(repository.storeMovies(movies));
    });

    test('should get movies locally', () {
      // arrange
      final expectedMovies = [tMovieEntity];
      when(repository.getMoviesLocally()).thenReturn(Right(expectedMovies));

      // act
      final result = usecase.getMoviesLocally();

      // assert
      expect(result, Right(expectedMovies));
      verify(repository.getMoviesLocally());
    });
  });
}
