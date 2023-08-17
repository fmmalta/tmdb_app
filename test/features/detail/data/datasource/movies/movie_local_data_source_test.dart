import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_local_data_source.dart';

import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

import 'mocks/movie_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieLocalDataSource>()])
void main() {
  late MovieLocalDataSource movieLocalDataSource;

  setUp(() {
    movieLocalDataSource = MockMovieLocalDataSource();
  });

  final tMovieEntity = MovieEntity(
    id: 550,
    title: 'Fight Club',
    overview: 'You dont talk about Fight Club',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    releaseDate: DateTime.now(),
  );

  group('storeMovies', () {
    test('should return true when saving movies to shared preferences',
        () async {
      // arrange
      when(movieLocalDataSource.storeMovies([tMovieEntity])).thenAnswer(
        (_) async => true,
      );
      final movies = [tMovieEntity];
// act
      final result = await movieLocalDataSource.storeMovies(movies);

      // assert
      expect(result, true);
      verify(movieLocalDataSource.storeMovies([tMovieEntity]));
    });

    test('should return false when saving movies to shared preferences fails',
        () async {
      // arrange
      when(movieLocalDataSource.storeMovies([tMovieEntity])).thenAnswer(
        (realInvocation) async => false,
      );
      final movies = [tMovieEntity];

      // act
      final result = await movieLocalDataSource.storeMovies(movies);

      // assert
      expect(result, false);
      verify(movieLocalDataSource.storeMovies([tMovieEntity]));
    });
  });

  group('getLocalMovies', () {
    test(
        'should return a list of movies when data is found in shared preferences',
        () {
      // arrange
      when(movieLocalDataSource.getLocalMovies()).thenReturn([tMovieEntity]);
// act
      final result = movieLocalDataSource.getLocalMovies();

      // assert
      expect(result, [tMovieEntity]);
      verify(movieLocalDataSource.getLocalMovies());
    });

    test(
        'should return an empty list when data is not found in shared preferences',
        () {
      // arrange
      when(movieLocalDataSource.getLocalMovies()).thenAnswer((_) => []);

      // act
      final result = movieLocalDataSource.getLocalMovies();

      // assert
      expect(result, []);
      verify(movieLocalDataSource.getLocalMovies());
    });
  });
}
