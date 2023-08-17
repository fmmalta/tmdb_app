import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_remote_data_source.dart';
import 'package:movie_app/features/content/data/models/movie_model.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

import 'mocks/movie_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockMovieRemoteDataSource();
  });

  group('getMovies', () {
    test('should return a list of MovieEntities', () async {
      // arrange
      final tMovies = {
        'adult': false,
        'genre_ids': [1, 2, 3],
        'id': 1,
        'original_language': 'en',
        'original_title': 'Movie Title',
        'overview': 'Movie Overview',
        'poster_path': '/path/to/poster',
        'release_date': '2022-01-01',
        'title': 'Movie Title',
      };

      when(dataSource.getMovies())
          .thenAnswer((_) async => [MovieModel.fromJson(tMovies).toEntity()]);
      // act
      final result = await dataSource.getMovies();
      // assert
      expect(result, equals([MovieModel.fromJson(tMovies).toEntity()]));
      verify(dataSource.getMovies());
    });
  });

  group('searchMovies', () {
    test('should return a list of MovieEntities', () async {
      // arrange
      final List<MovieEntity> movies = [];
      const tQuery = 'test query';
      final tMovies = {
        'adult': false,
        'genre_ids': [1, 2, 3],
        'id': 1,
        'original_language': 'en',
        'original_title': 'Movie Title',
        'overview': 'Movie Overview',
        'poster_path': '/path/to/poster',
        'release_date': '2022-01-01',
        'title': 'Movie Title',
      };
      when(dataSource.searchMovies(tQuery)).thenAnswer((realInvocation) async {
        movies.add(MovieModel.fromJson(tMovies).toEntity());
        return movies;
      });
      // act
      final result = await dataSource.searchMovies(tQuery);
      // assert
      expect(result, equals([MovieModel.fromJson(tMovies).toEntity()]));
      verify(dataSource.searchMovies(tQuery));
    });
  });
}
