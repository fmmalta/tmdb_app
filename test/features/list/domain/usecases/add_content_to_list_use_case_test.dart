import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/list/domain/usecases/add_content_to_list_use_case.dart';

import 'favorite_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteListRepository>()])
void main() {
  late AddContentToListUseCase useCase;
  late MockFavoriteListRepository repository;

  setUp(() {
    repository = MockFavoriteListRepository();
    useCase = AddContentToListUseCase(repository);
  });

  const tListID = '1';
  final Content tContent = MovieDetailEntity(
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

  test('should call repository with correct values', () async {
    // arrange
    when(repository.addContentToList(tListID, tContent))
        .thenAnswer((_) async => const Right(true));
    // act
    await useCase(tListID, tContent);
    // assert
    verify(repository.addContentToList(tListID, tContent));
  });
}
