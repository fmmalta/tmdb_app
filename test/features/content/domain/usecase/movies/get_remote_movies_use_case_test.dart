import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/failure.dart';

import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';
import 'package:movie_app/features/content/domain/usecases/movies/get_remote_movies_use_case.dart';

import 'mocks/get_remote_movies_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRemoteRepository>()])
void main() {
  late MoviesRemoteRepository mockMoviesRemoteRepository;
  late GetRemoteMoviesUseCase usecase;

  setUp(() {
    mockMoviesRemoteRepository = MockMoviesRemoteRepository();
    usecase = GetRemoteMoviesUseCase(mockMoviesRemoteRepository);
  });

  final tMovieEntity = MovieEntity(
    id: 550,
    title: 'Fight Club',
    overview: 'You dont talk about Fight Club',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    releaseDate: DateTime.now(),
  );

  test('should get movies from repository', () async {
    // arrange
    when(mockMoviesRemoteRepository.getMovies())
        .thenAnswer((_) async => Right([tMovieEntity]));
    // act
    final result = await usecase();
    // assert
    result.fold((Failure failure) {}, (movies) {
      expect(result, equals(Right(movies)));
      verify(mockMoviesRemoteRepository.getMovies());
      verifyNoMoreInteractions(mockMoviesRemoteRepository);
    });
  });
}
