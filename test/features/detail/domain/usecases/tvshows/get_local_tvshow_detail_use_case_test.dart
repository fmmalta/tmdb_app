import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_local_detail_repository.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/get_local_tvshow_detail_use_case.dart';

import 'mocks/get_local_tvshow_detail_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TVShowLocalDetailRepository>()])
void main() {
  late GetLocalTVShowDetailUseCase usecase;
  late MockTVShowLocalDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockTVShowLocalDetailRepository();
    usecase = GetLocalTVShowDetailUseCase(mockRepository);
  });

  final ttvShowDetailEntity = TVShowDetailEntity(
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

  test('should get local tv show detail from repository', () async {
    // arrange
    when(mockRepository.getLocalTVShowDetail(ttvShowDetailEntity.id))
        .thenAnswer((realInvocation) async => Right(ttvShowDetailEntity));
    // act
    final result = await usecase(ttvShowDetailEntity.id);
    // assert
    result.fold((l) => null, (movie) {
      expect(result, Right(movie));
      verify(mockRepository.getLocalTVShowDetail(ttvShowDetailEntity.id));
    });
  });
}
