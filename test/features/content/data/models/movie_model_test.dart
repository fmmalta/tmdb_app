import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/content/data/models/movie_model.dart';

import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

void main() {
  final tMovieModel = MovieModel(
    id: 1,
    originalLanguage: 'en',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: DateTime.now(),
    title: 'title',
  );

  final tMovieEntity = MovieEntity(
    id: 1,
    originalLanguage: 'en',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: DateTime.now(),
    title: 'title',
  );
  group('MovieModel', () {
    test('toJson', () {
      // arrange
      // act
      final result = tMovieModel.toJson();
      // assert
      expect(result, {
        'id': 1,
        'original_language': 'en',
        'overview': 'overview',
        'poster_path': 'posterPath',
        'release_date': tMovieModel.releaseDate.toIso8601String(),
        'title': 'title',
      });
    });

    test('fromJson', () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'original_language': 'en',
        'overview': 'overview',
        'poster_path': 'posterPath',
        'release_date': DateTime.now().toIso8601String(),
        'title': 'title',
      };
      // act
      final result = MovieModel.fromJson(jsonMap);
      // assert
      expect(result, tMovieModel);
    });

    test('fromEntity', () {
      // arrange

      // act
      final result = MovieModel.fromEntity(tMovieEntity);
      // assert
      expect(result, tMovieModel);
    });

    test('toEntity', () {
      // arrange

      // act
      final result = tMovieModel.toEntity();
      // assert
      expect(result, tMovieEntity);
    });
  });
}
