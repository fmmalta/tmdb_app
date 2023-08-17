import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_local_remote_data_source.dart';
import 'package:movie_app/features/detail/data/repositories/movie/movie_detail_local_repository_impl.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_local_repository.dart';

import 'mocks/movie_detail_local_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieDetailLocalDataSource>()])
void main() {
  late MovieDetailLocalRepository repository;
  late MovieDetailLocalDataSource dataSource;

  setUp(() {
    dataSource = MockMovieDetailLocalDataSource();
    repository = MovieDetailLocalRepositoryImpl(dataSource);
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

  group('storeMovieDetail', () {
    test('should call data source and return right result', () async {
      // arrange
      when(dataSource.storeMovieDetail(tMovie)).thenAnswer((_) async => true);
      // act
      final result = await repository.storeMovieDetail(tMovie);
      // assert
      expect(result, const Right(true));
      verify(dataSource.storeMovieDetail(tMovie));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return false result when data source throws', () async {
      // arrange
      when(dataSource.storeMovieDetail(tMovie)).thenAnswer((_) async => false);
      // act
      final result = await repository.storeMovieDetail(tMovie);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.storeMovieDetail(tMovie));
        verifyNoMoreInteractions(dataSource);
      }, (r) => null);
    });
  });

  group('getMoviesDetailLocally', () {
    test('should call data source and return right result', () async {
      // arrange
      when(dataSource.getLocalMovieDetail(tMovie.id))
          .thenAnswer((_) async => tMovie);
      // act
      final result = await repository.getLocalMovieDetail(tMovie.id);
      // assert
      result.fold((failure) {}, (movieDetail) {
        expect(result, Right(movieDetail));
        verify(dataSource.getLocalMovieDetail(tMovie.id));
        verifyNoMoreInteractions(dataSource);
      });
    });

    test('should return an empty list result when there is no data', () async {
      // arrange
      when(dataSource.getLocalMovieDetail(tMovie.id))
          .thenAnswer((_) async => tMovie);
      // act
      final result = await repository.getLocalMovieDetail(tMovie.id);
      // assert
      result.fold((l) => null, (movies) {
        expect(result, Right(movies));
        verify(dataSource.getLocalMovieDetail(tMovie.id));
        verifyNoMoreInteractions(dataSource);
      });
    });
  });
}
