import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/search_tvshows_use_case.dart';

import 'mocks/search_tv_shows_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsRemoteRepository>()])
void main() {
  late MockTVShowsRemoteRepository mockTVShowsRemoteRepository;
  late SearchTVShowsUseCase searchTVShowsUseCase;

  setUp(() {
    mockTVShowsRemoteRepository = MockTVShowsRemoteRepository();
    searchTVShowsUseCase = SearchTVShowsUseCase(mockTVShowsRemoteRepository);
  });

  const tQuery = 'Breaking Bad';
  final tTVShowsEntity = TVShowsEntity(
    id: 550,
    name: 'Breaking Bad',
    overview: 'Walter White discover he has cancer',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    originalName: 'Breaking Bad',
    firstAirDate: DateTime.now(),
  );

  test(
      'should call TVShowsRemoteRepository.searchTvShows with correct parameters',
      () async {
    // arrange
    when(mockTVShowsRemoteRepository.searchTvShows(tQuery))
        .thenAnswer((_) async => Right([tTVShowsEntity]));
    // act
    await searchTVShowsUseCase(tQuery);
    // assert
    verify(mockTVShowsRemoteRepository.searchTvShows(tQuery));
  });
}
