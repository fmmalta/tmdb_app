import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_remote_data_source.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

import 'mocks/tvshow_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsRemoteDataSource>()])
void main() {
  late TVShowsRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockTVShowsRemoteDataSource();
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

  test('should get a list of TV shows', () async {
    // arrange
    when(remoteDataSource.getTVShows()).thenAnswer((_) async => tTVShows);

    // act
    final result = await remoteDataSource.getTVShows();

    // assert
    expect(result, tTVShows);
    verify(remoteDataSource.getTVShows());
  });

  test('should search for TV shows', () async {
    // arrange
    const tQuery = 'test';

    when(remoteDataSource.searchTVShows(tQuery))
        .thenAnswer((_) async => tTVShows);

    // act
    final result = await remoteDataSource.searchTVShows(tQuery);

    // assert
    expect(result, tTVShows);
    verify(remoteDataSource.searchTVShows(tQuery));
  });
}
