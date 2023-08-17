import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_local_tv_shows_use_case.dart';

import 'mocks/get_local_tv_shows_use_case_test.mocks.dart';

@GenerateMocks([TVShowsLocalRepository])
void main() {
  late GetLocalTVShowsUseCase usecase;
  late TVShowsLocalRepository repository;

  setUp(() {
    repository = MockTVShowsLocalRepository();
    usecase = GetLocalTVShowsUseCase(repository);
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
  test('should get tv shows from repository', () async {
    // arrange
    when(repository.getTVShows())
        .thenAnswer((_) async => Right([tTVShowsEntity]));
    // act
    final result = await usecase.call();
    // assert
    result.fold((l) {}, (tvshows) {
      expect(result, Right(tvshows));
      verify(repository.getTVShows());
      verifyNoMoreInteractions(repository);
    });
  });
}
