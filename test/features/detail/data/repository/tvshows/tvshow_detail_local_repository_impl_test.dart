import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_local_data_source.dart';
import 'package:movie_app/features/detail/data/repositories/tvshow/tvshow_local_detail_repository_impl.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_local_detail_repository.dart';

import 'mocks/tvshow_detail_local_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowDetailLocalDataSource>()])
void main() {
  late TVShowLocalDetailRepository repository;
  late MockTVShowDetailLocalDataSource dataSource;

  setUp(() {
    dataSource = MockTVShowDetailLocalDataSource();
    repository = TVShowLocalDetailRepositoryImpl(dataSource);
  });

  final tTVShowsEntity = TVShowDetailEntity(
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
    test('should return a list of TVShowsEntity', () async {
      // arrange
      when(dataSource.getLocalTVShowDetail(tTVShowsEntity.id))
          .thenAnswer((_) async => tTVShowsEntity);
      // act
      final result = await repository.getLocalTVShowDetail(tTVShowsEntity.id);
      // assert
      expect(result, Right(tTVShowsEntity));
      verify(dataSource.getLocalTVShowDetail(tTVShowsEntity.id));
    });

    test('should return a Failure when getting TVShows fails', () async {
      // arrange
      when(dataSource.getLocalTVShowDetail(tTVShowsEntity.id))
          .thenAnswer((_) async => tTVShowsEntity);
      // act
      final result = await repository.getLocalTVShowDetail(tTVShowsEntity.id);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.getLocalTVShowDetail(tTVShowsEntity.id));
      }, (r) => null);
    });
  });

  group('storeTVShows', () {
    test('should return true when storing TVShows succeeds', () async {
      // arrange
      when(dataSource.storeTVShowDetail(tTVShowsEntity))
          .thenAnswer((_) async => true);
      // act
      final result = await repository.storeTVShowDetail(tTVShowsEntity);
      // assert
      expect(result, const Right(true));
      verify(dataSource.storeTVShowDetail(tTVShowsEntity));
    });

    test('should return a Failure when storing TVShows fails', () async {
      // arrange
      when(dataSource.storeTVShowDetail(tTVShowsEntity))
          .thenAnswer((_) async => false);
      // act
      final result = await repository.storeTVShowDetail(tTVShowsEntity);
      // assert
      result.fold((failure) {
        expect(result, Left(failure));
        verify(dataSource.storeTVShowDetail(tTVShowsEntity));
      }, (r) => null);
    });
  });
}
