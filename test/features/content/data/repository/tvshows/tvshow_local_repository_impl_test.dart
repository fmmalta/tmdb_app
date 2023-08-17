import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_local_data_source.dart';
import 'package:movie_app/features/content/data/repositories/tvshows/tvshows_local_repository_impl.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/tvshow_local_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsLocalDataSource>()])
void main() {
  late TVShowsLocalRepository repository;
  late MockTVShowsLocalDataSource dataSource;

  setUp(() {
    dataSource = MockTVShowsLocalDataSource();
    repository = TVShowsLocalRepositoryImpl(dataSource);
  });

  group('getTVShows', () {
    test('should return a list of TVShowsEntity', () async {
      // arrange
      when(dataSource.getLocalTVShows()).thenAnswer((_) => tTVShows);
      // act
      final result = await repository.getTVShows();
      // assert
      expect(result, Right(tTVShows));
      verify(dataSource.getLocalTVShows());
    });

    test('should return a Failure when getting TVShows fails', () async {
      // arrange
      when(dataSource.getLocalTVShows()).thenAnswer((_) => []);
      // act
      final result = await repository.getTVShows();
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.getLocalTVShows());
      }, (r) => null);
    });
  });

  group('storeTVShows', () {
    test('should return true when storing TVShows succeeds', () async {
      // arrange
      when(dataSource.storeTVShows(any)).thenAnswer((_) async => true);
      // act
      final result = await repository.storeTVShows(tTVShows);
      // assert
      expect(result, const Right(true));
      verify(dataSource.storeTVShows(tTVShows));
    });

    test('should return a Failure when storing TVShows fails', () async {
      // arrange
      when(dataSource.storeTVShows(any)).thenAnswer((_) async => false);
      // act
      final result = await repository.storeTVShows(tTVShows);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.storeTVShows(tTVShows));
      }, (r) => null);
    });
  });
}

final List<TVShowsEntity> tTVShows = [
  TVShowsEntity(
    id: 1,
    name: 'The Big Bang Theory',
    overview:
        'The Big Bang Theory is centered on five characters living in Pasadena, California: roommates Leonard Hofstadter, Sheldon Cooper, Howard Wolowitz, and Rajesh Koothrappali, and their friend, Dr. Penny. Leonard is a physicist who has a difficult time relating to people, while Sheldon is a brilliant but socially awkward theoretical physicist. Howard is a physicist who is obsessed with video games, and Rajesh is an engineer who works at NASA. Dr. Penny is a neuroscientist who has a crush on Leonard.',
    posterPath: '/path/to/poster',
    firstAirDate: DateTime.parse('2007-09-24'),
    originalLanguage: 'en',
    originalName: 'The Big Bang Theory',
  ),
];
