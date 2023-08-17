import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/store_tv_shows_use_case.dart';

import 'mocks/store_tv_shows_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsLocalRepository>()])
void main() {
  late StoreTVShowsUseCase usecase;
  late MockTVShowsLocalRepository repository;

  setUp(() {
    repository = MockTVShowsLocalRepository();
    usecase = StoreTVShowsUseCase(repository);
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

  test('should call repository with correct data', () async {
    // arrange
    when(repository.storeTVShows(tTVShows))
        .thenAnswer((_) async => right(true));
    // act
    await usecase(tTVShows);
    // assert
    verify(repository.storeTVShows(tTVShows));
  });

  test('should return right(true) when repository returns right(true)',
      () async {
    // arrange
    when(repository.storeTVShows(tTVShows))
        .thenAnswer((_) async => right(true));
    // act
    final result = await usecase(tTVShows);
    // assert
    expect(result, right(true));
  });

  test('should return left(Failure) when repository returns left(Failure)',
      () async {
    // arrange
    when(repository.storeTVShows(tTVShows))
        .thenAnswer((_) async => const Left(StoreContentFailure()));
    // act
    final result = await usecase(tTVShows);
    // assert
    expect(result, left(const StoreContentFailure()));
  });
}
