import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_remote_tv_shows_use_case.dart';

import 'mocks/get_remote_tv_shows_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowsRemoteRepository>()])
void main() {
  late MockTVShowsRemoteRepository mockTVShowsRemoteRepository;
  late GetRemoteTVShowsUseCase getRemoteTVShowsUseCase;

  setUp(() {
    mockTVShowsRemoteRepository = MockTVShowsRemoteRepository();
    getRemoteTVShowsUseCase =
        GetRemoteTVShowsUseCase(mockTVShowsRemoteRepository);
  });

  final tTVShowsEntity = TVShowsEntity(
    id: 550,
    name: 'Breaking Bad',
    overview: 'Walter White discover he has cancer',
    posterPath: 'posterPath',
    originalLanguage: 'en',
    originalName: 'Breaking Bad',
    firstAirDate: DateTime.now(),
  );

  test('should return a list of TVShows entities', () async {
    // arrange
    when(mockTVShowsRemoteRepository.getTVShows())
        .thenAnswer((_) async => Right([tTVShowsEntity]));
// act
    final result = await getRemoteTVShowsUseCase.call();

// assert
    result.fold((l) => null, (tvshows) {
      expect(result, Right(tvshows));
      verify(mockTVShowsRemoteRepository.getTVShows());
      verifyNoMoreInteractions(mockTVShowsRemoteRepository);
    });
  });
}
