import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_local_data_source.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

import 'mocks/tvshow_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsLocalDataSource>()])
void main() {
  late TVShowsLocalDataSource dataSource;

  setUp(() {
    dataSource = MockTVShowsLocalDataSource();
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

  group('storeTVShows', () {
    test('stores the given TV shows in local storage', () async {
      // arrange
      when(dataSource.storeTVShows(tTVShows)).thenAnswer((_) async => true);

      // act
      await dataSource.storeTVShows(tTVShows);

      // assert
      verify(dataSource.storeTVShows(tTVShows));
    });
  });

  group('getLocalTVShows', () {
    test('returns an empty list when no TV shows are found', () {
      // arrange
      when(dataSource.getLocalTVShows()).thenAnswer((_) => []);

      // act
      final result = dataSource.getLocalTVShows();

      // assert
      expect(result, []);
    });

    test('returns a list of TV shows when they are found', () {
      // arrange
      when(dataSource.getLocalTVShows()).thenReturn(tTVShows);

      // act
      final result = dataSource.getLocalTVShows();

      // assert
      expect(result, tTVShows);
    });
  });
}
