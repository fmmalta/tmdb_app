import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/remove_content_from_list_use_case.dart';
import 'favorite_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late RemoveContentFromListUseCase usecase;
  late MockFavoriteListRepository repository;

  setUp(() {
    repository = MockFavoriteListRepository();
    usecase = RemoveContentFromListUseCase(repository);
  });

  const tListID = '1';
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

  test('should call repository with correct params', () async {
    // arrange
    when(repository.removeContentFromList(tListID, tMovieDetail))
        .thenAnswer((_) async => const Right(true));
    // act
    await usecase(tListID, tMovieDetail);
    // assert
    verify(repository.removeContentFromList(tListID, tMovieDetail));
  });

  test('should return right(true) when repository returns right(true)',
      () async {
    // arrange
    when(repository.removeContentFromList(tListID, tMovieDetail))
        .thenAnswer((_) async => const Right(true));
    // act
    final result = await usecase(tListID, tMovieDetail);
    // assert
    expect(result, const Right(true));
  });

  test('should return left(failure) when repository returns left(failure)',
      () async {
    // arrange
    when(repository.removeContentFromList(tListID, tMovieDetail))
        .thenThrow(Exception());
    // assert
    expect(() => usecase(tListID, tMovieDetail), throwsException);
  });
}
