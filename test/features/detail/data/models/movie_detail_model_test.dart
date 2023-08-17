import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/detail/data/models/movie_detail_model.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';

import 'mocks/movie_detail_mock.dart';

void main() {
  final tMovieModel = MovieDetailModel(
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

  final tMovieDetail = MovieDetailEntity(
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
  group('MovieDetailModel', () {
    test('toJson', () {
      // arrange
      // act
      final result = tMovieModel.toJson();
      // assert
      expect(result, movieDetailRawMock);
    });

    test('fromJson', () {
      // arrange
      final Map<String, dynamic> jsonMap = movieDetailRawMock;
      // act
      final result = MovieDetailModel.fromJson(jsonMap);
      // assert
      expect(result, tMovieModel);
    });

    test('fromEntity', () {
      // arrange

      // act
      final result = MovieDetailModel.fromEntity(tMovieDetail);
      // assert
      expect(result, tMovieModel);
    });

    test('toEntity', () {
      // arrange

      // act
      final result = tMovieModel.toEntity();
      // assert
      expect(result, tMovieDetail);
    });
  });
}
