import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_local_data_source.dart';
import 'package:movie_app/features/content/data/repositories/movies/movies_local_repository_impl.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';

import 'mocks/movie_local_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieLocalDataSource>()])
void main() {
  late MoviesLocalRepository repository;
  late MovieLocalDataSource dataSource;

  setUp(() {
    dataSource = MockMovieLocalDataSource();
    repository = MoviesLocalRepositoryImpl(dataSource);
  });
  final tMovies = [
    MovieEntity(
      id: 550,
      title: 'Fight Club',
      overview: 'You dont talk about Fight Club',
      posterPath: 'posterPath',
      originalLanguage: 'en',
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      id: 551,
      title: 'Fight Club 2',
      overview: 'You dont talk about Fight Club 2',
      posterPath: 'posterPath',
      originalLanguage: 'en',
      releaseDate: DateTime.now(),
    ),
  ];

  group('storeMovies', () {
    test('should call data source and return right result', () async {
      // arrange
      when(dataSource.storeMovies(tMovies)).thenAnswer((_) async => true);
      // act
      final result = await repository.storeMovies(tMovies);
      // assert
      expect(result, const Right(true));
      verify(dataSource.storeMovies(tMovies));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return false result when data source throws', () async {
      // arrange
      when(dataSource.storeMovies(tMovies)).thenAnswer((_) async => false);
      // act
      final result = await repository.storeMovies(tMovies);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.storeMovies(tMovies));
        verifyNoMoreInteractions(dataSource);
      }, (r) => null);
    });
  });

  group('getMoviesLocally', () {
    test('should call data source and return right result', () async {
      // arrange
      when(dataSource.getLocalMovies()).thenAnswer((_) => tMovies);
      // act
      final result = repository.getMoviesLocally();
      // assert
      expect(result, Right(tMovies));
      verify(dataSource.getLocalMovies());
      verifyNoMoreInteractions(dataSource);
    });

    test('should return an empty list result when there is no data', () async {
      // arrange
      when(dataSource.getLocalMovies()).thenAnswer((_) => []);
      // act
      final result = repository.getMoviesLocally();
      // assert
      result.fold((l) => null, (movies) {
        expect(result, Right(movies));
        verify(dataSource.getLocalMovies());
        verifyNoMoreInteractions(dataSource);
      });
    });
  });
}
