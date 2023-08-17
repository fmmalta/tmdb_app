// movie_remote_datasource_mock.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/core/exceptions.dart';

import 'package:movie_app/core/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_detail_remote_data_source.dart';
import 'package:movie_app/features/detail/data/repositories/movie/movie_detail_remote_repository_impl.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_remote_repository.dart';

import 'mocks/movie_detail_remote_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieDetailRemoteDataSource>()])
void main() {
  late MovieDetailRemoteRepository repository;
  late MockMovieDetailRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieDetailRemoteDataSource();
    repository = MovieDetailRemoteRepositoryImpl(mockMovieRemoteDataSource);
  });

  final tMovie = MovieDetailEntity(
    id: 550,
    backdropPath: "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
    genres: [Genre(name: "Drama")],
    originalLanguage: 'en',
    originalTitle: 'Fight Club',
    overview:
        'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
    posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
    releaseDate: DateTime.parse('1999-10-15'),
    title: 'Fight Club',
  );
  group('getMovies', () {
    test(
        'should return a list of movies when the datasource returns a list of movies',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovieDetail(tMovie.id))
          .thenAnswer((_) async => tMovie);

      // Act
      final result = await repository.getMovieDetail(tMovie.id);

      // Assert
      expect(result, Right(tMovie));
      verify(mockMovieRemoteDataSource.getMovieDetail(tMovie.id));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return a NoConnectionFailure when the datasource returns a NoConnectionException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovieDetail(tMovie.id))
          .thenThrow(NoConnectionException());

      // Act
      final result = await repository.getMovieDetail(tMovie.id);

      // Assert
      expect(result, const Left(NoConnectionFailure()));
      verify(mockMovieRemoteDataSource.getMovieDetail(tMovie.id));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return an APIFailure when the datasource returns an APIException',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovieDetail(tMovie.id))
          .thenThrow(APIException({
        'success': false,
        'status_code': 105,
        'status_message': 'Internal Server Error',
      }));

      // Act
      final result = await repository.getMovieDetail(tMovie.id);

      // Assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockMovieRemoteDataSource.getMovieDetail(tMovie.id));
        verifyNoMoreInteractions(mockMovieRemoteDataSource);
      }, (r) => null);
    });

    test('should throw an exception when the datasource throws an exception',
        () async {
      // Arrange
      when(mockMovieRemoteDataSource.getMovieDetail(tMovie.id))
          .thenThrow(Exception());

      // Act & Assert
      expect(() => repository.getMovieDetail(tMovie.id), throwsException);
      verify(mockMovieRemoteDataSource.getMovieDetail(tMovie.id));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });
}
