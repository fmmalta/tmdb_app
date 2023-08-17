// movie_remote_datasource_mock.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/core/exceptions.dart';

import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_remote_data_source.dart';
import 'package:movie_app/features/content/data/repositories/movies/movies_remote_repository_impl.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';

import 'package:mockito/mockito.dart';

import 'mocks/movie_remote_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MoviesRemoteRepository repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository = MoviesRemoteRepositoryImpl(mockMovieRemoteDataSource);
  });

  group('getMovies', () {
    final tMovies = <MovieEntity>[];

    test(
        'should return a list of movies when the datasource returns a list of movies',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovies())
          .thenAnswer((_) async => tMovies);

      // Act
      final result = await repository.getMovies();

      // Assert
      expect(result, Right(tMovies));
      verify(mockMovieRemoteDataSource.getMovies());
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return a NoConnectionFailure when the datasource returns a NoConnectionException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovies())
          .thenThrow(NoConnectionException());

      // Act
      final result = await repository.getMovies();

      // Assert
      expect(result, const Left(NoConnectionFailure()));
      verify(mockMovieRemoteDataSource.getMovies());
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return an APIFailure when the datasource returns an APIException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovies()).thenThrow(APIException({
        'success': false,
        'status_code': 105,
        'status_message': 'Internal Server Error',
      }));

      // Act
      final result = await repository.getMovies();

      // Assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockMovieRemoteDataSource.getMovies());
        verifyNoMoreInteractions(mockMovieRemoteDataSource);
      }, (r) => null);
    });

    test('should throw an exception when the datasource throws an exception',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovies()).thenThrow(Exception());

      // Act & Assert
      expect(() => repository.getMovies(), throwsException);
      verify(mockMovieRemoteDataSource.getMovies());
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  group('searchMovies', () {
    final tMovies = <MovieEntity>[];
    const tQuery = 'test query';

    test(
        'should return a list of movies when the datasource returns a list of movies',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.searchMovies(tQuery))
          .thenAnswer((_) async => tMovies);

      // Act
      final result = await repository.searchMovies(tQuery);

      // Assert
      result.fold((l) => null, (movies) {
        expect(result, Right(tMovies));
        verify(mockMovieRemoteDataSource.searchMovies(tQuery));
        verifyNoMoreInteractions(mockMovieRemoteDataSource);
      });
    });

    test(
        'should return a NoConnectionFailure when the datasource returns a NoConnectionException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.searchMovies(tQuery))
          .thenThrow(NoConnectionException());

      // Act
      final result = await repository.searchMovies(tQuery);

      // Assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockMovieRemoteDataSource.searchMovies(tQuery));
        verifyNoMoreInteractions(mockMovieRemoteDataSource);
      }, (r) => null);
    });

    test(
        'should return an APIFailure when the datasource returns an APIException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.searchMovies(tQuery))
          .thenThrow(APIException({
        'success': false,
        'status_code': 105,
        'status_message': 'Internal Server Error',
      }));

      // Act
      final result = await repository.searchMovies(tQuery);

      // Assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockMovieRemoteDataSource.searchMovies(tQuery));
        verifyNoMoreInteractions(mockMovieRemoteDataSource);
      }, (r) => null);
    });
  });
}
