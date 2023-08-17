import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';

import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_remote_data_source.dart';
import 'package:movie_app/features/detail/data/repositories/tvshow/tvshow_remote_detail_repository_impl.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_remote_detail_repository.dart';

import 'mocks/tvshow_detail_remote_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowDetailRemoteDataSource>()])
void main() {
  late TVShowDetailRemoteRepository repository;
  late MockTVShowDetailRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockTVShowDetailRemoteDataSource();
    repository = TVShowDetailRemoteRepositoryImpl(mockRemoteDataSource);
  });
  final tTVShows = TVShowDetailEntity(
    backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
    createdBy: [CreatedBy(name: "Vince Gilligan")],
    firstAirDate: DateTime.parse('2008-01-20'),
    genres: [Genre(name: 'Drama'), Genre(name: 'Crime')],
    id: 1396,
    name: 'Breaking Bad',
    networks: [
      Network(
        id: 174,
        logoPath: '/alqLicR1ZMHMaZGP3xRQxn9sq7p.png',
        name: 'AMC',
        originCountry: 'US',
      )
    ],
    numberOfSeasons: 5,
    originalLanguage: 'en',
    originalName: 'Breaking Bad',
    overview:
        'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.',
    posterPath: '/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg',
    seasons: [],
  );

  group('getTVShows', () {
    test('should return a list of TVShows entities', () async {
      // arrange
      when(mockRemoteDataSource.getTVShowDetail(tTVShows.id))
          .thenAnswer((_) async => tTVShows);
      // act
      final result = await repository.getTVShowDetail(tTVShows.id);
      // assert
      expect(result, Right(tTVShows));
      verify(mockRemoteDataSource.getTVShowDetail(tTVShows.id));
    });

    test(
        'should return a APIFailure when getting TVShows throws a APIException',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShowDetail(tTVShows.id))
          .thenThrow(APIException({}));
      // act
      final result = await repository.getTVShowDetail(tTVShows.id);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(mockRemoteDataSource.getTVShowDetail(tTVShows.id));
      }, (r) => null);
    });

    test(
        'should return a NoConnectionFailure when getting TVShows throws a NoConnectionException',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShowDetail(tTVShows.id))
          .thenThrow(NoConnectionException());
      // act
      final result = await repository.getTVShowDetail(tTVShows.id);
      // assert
      expect(result, const Left(NoConnectionFailure()));
      verify(mockRemoteDataSource.getTVShowDetail(tTVShows.id));
    });

    test('should return an exception when getting TVShows throws an exception',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVShowDetail(tTVShows.id))
          .thenThrow(Exception());

      // assert
      expect(() => repository.getTVShowDetail(tTVShows.id), throwsException);
      verify(mockRemoteDataSource.getTVShowDetail(tTVShows.id));
    });
  });
}
