import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_remote_repository.dart';

import 'package:movie_app/features/detail/domain/usecases/movie/get_remote_movie_detail_use_case.dart';

import 'mocks/get_remote_movie_detail_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieDetailRemoteRepository>()])
void main() {
  late GetRemoteMovieDetailUseCase usecase;
  late MockMovieDetailRemoteRepository mockRemoteRepository;

  setUp(() {
    mockRemoteRepository = MockMovieDetailRemoteRepository();
    usecase = GetRemoteMovieDetailUseCase(mockRemoteRepository);
  });

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

  test('should get movie detail from remote repository', () async {
    // arrange

    when(mockRemoteRepository.getMovieDetail(tMovieDetail.id))
        .thenAnswer((_) async => Right(tMovieDetail));
    // act
    final result = await usecase(tMovieDetail.id);
    // assert
    result.fold((l) => null, (movie) {
      expect(result, Right(movie));
      verify(mockRemoteRepository.getMovieDetail(tMovieDetail.id));
      verifyNoMoreInteractions(mockRemoteRepository);
    });
  });
}
