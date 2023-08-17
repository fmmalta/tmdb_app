import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_remote_data_source.dart';
import 'package:movie_app/features/content/data/repositories/tvshows/tvshows_remote_repository_impl.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';

import 'mocks/tvshow_remote_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsRemoteDataSource>()])
void main() {
  late TVShowsRemoteRepository repository;
  late MockTVShowsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockTVShowsRemoteDataSource();
    repository = TVShowsRemoteRepositoryImpl(mockRemoteDataSource);
  });
  final tTVShows = [
    TVShowsEntity(
      id: 1,
      name: 'Game of Thrones',
      overview: 'A fantasy drama series',
      posterPath: 'https://image.tmdb.org/t/p/w500/path/to/poster',
      firstAirDate: DateTime.parse('2011-04-17'),
      originalLanguage: 'en',
      originalName: 'Game of Thrones',
    ),
    TVShowsEntity(
      id: 2,
      name: 'The Big Bang Theory',
      overview: 'A comedy series about scientists',
      posterPath: 'https://image.tmdb.org/t/p/w500/path/to/poster',
      firstAirDate: DateTime.parse('2007-09-24'),
      originalLanguage: 'en',
      originalName: 'The Big Bang Theory',
    ),
  ];

  group('getTVShows', () {
    test('should return a list of TVShows entities', () async {
      // arrange
      when(mockRemoteDataSource.getTVShows()).thenAnswer((_) async => tTVShows);
      // act
      final result = await repository.getTVShows();
      // assert
      expect(result, Right(tTVShows));
      verify(mockRemoteDataSource.getTVShows());
    });

    test(
        'should return a APIFailure when getting TVShows throws a APIException',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShows()).thenThrow(APIException({}));
      // act
      final result = await repository.getTVShows();
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockRemoteDataSource.getTVShows());
      }, (r) => null);
    });

    test(
        'should return a NoConnectionFailure when getting TVShows throws a NoConnectionException',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShows())
          .thenThrow(NoConnectionException());
      // act
      final result = await repository.getTVShows();
      // assert
      expect(result, const Left(NoConnectionFailure()));
      verify(mockRemoteDataSource.getTVShows());
    });

    test('should return an exception when getting TVShows throws an exception',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShows()).thenThrow(Exception());

      // assert
      expect(() => repository.getTVShows(), throwsException);
      verify(mockRemoteDataSource.getTVShows());
    });
  });

  group('searchTvShows', () {
    test('should return a list of TVShows entities', () async {
      // arrange
      when(mockRemoteDataSource.searchTVShows('test'))
          .thenAnswer((_) async => tTVShows);
      // act
      final result = await repository.searchTvShows('test');
      // assert
      expect(result, Right(tTVShows));
      verify(mockRemoteDataSource.searchTVShows('test'));
    });

    test(
        'should return a APIFailure when searching TVShows throws a APIException',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVShows('test'))
          .thenThrow(APIException({}));
      // act
      final result = await repository.searchTvShows('test');
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockRemoteDataSource.searchTVShows('test'));
      }, (r) => null);
    });

    test(
        'should return a NoConnectionFailure when searching TVShows throws a NoConnectionException',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVShows('test'))
          .thenThrow(NoConnectionException());
      // act
      final result = await repository.searchTvShows('test');
      // assert
      expect(result, const Left(NoConnectionFailure()));
      verify(mockRemoteDataSource.searchTVShows('test'));
    });

    test(
        'should return an exception when searching TVShows throws an exception',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVShows('test')).thenThrow(Exception());
      // assert

      expect(() => repository.searchTvShows('test'), throwsException);
      verify(mockRemoteDataSource.searchTVShows('test'));
    });
  });
}
