import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/list/data/datasources/favorite_list_data_source.dart';
import 'package:movie_app/features/list/data/repositories/favorite_list_repository_impl.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/favorite_list_entity_mock.dart';
import 'favorite_list_repository_impl_test.mocks.dart';

@GenerateMocks([FavoriteListDataSource])
void main() {
  late FavoriteListRepository repository;
  late FavoriteListDataSource dataSource;

  setUp(() {
    dataSource = MockFavoriteListDataSource();
    repository = FavoriteListRepositoryImpl(dataSource);
  });

  const tTitle = 'Minha lista';
  const String listID = '1';
  const tNewTitle = "Novo título";

  final tMovieDetailEntity = MovieDetailEntity(
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

  test('should create favorite list', () async {
    // arrange
    when(dataSource.createFavoriteList(tTitle)).thenAnswer((_) async => true);
    // act
    final result = await repository.createFavoriteList(tTitle);
    // assert
    expect(result, const Right(true));
    verify(dataSource.createFavoriteList(tTitle));
  });

  test('should delete favorite list', () async {
    // arrange
    when(dataSource.deleteFavoriteList(listID)).thenAnswer((_) async => true);
    // act
    final result = await repository.deleteFavoriteList(listID);
    // assert
    expect(result, const Right(true));
    verify(dataSource.deleteFavoriteList(listID));
  });

  test('should get favorite lists', () async {
    // arrange

    when(dataSource.getFavoriteList()).thenAnswer((_) async => tFavoriteList);
    // act
    final result = await repository.getFavoriteLists();
    // assert
    expect(result, Right(tFavoriteList));
    verify(dataSource.getFavoriteList());
  });

  test('should add content to list', () async {
    // arrange
    when(dataSource.addContentToList(listID, tMovieDetailEntity))
        .thenAnswer((_) async => true);
    // act
    final result =
        await repository.addContentToList(listID, tMovieDetailEntity);
    // assert
    expect(result, const Right(true));
    verify(dataSource.addContentToList(listID, tMovieDetailEntity));
  });

  test('should remove content from list', () async {
    // arrange
    when(dataSource.removeContentFromList(listID, tMovieDetailEntity))
        .thenAnswer((_) async => true);
    // act
    final result =
        await repository.removeContentFromList(listID, tMovieDetailEntity);
    // assert
    expect(result, const Right(true));
    verify(dataSource.removeContentFromList(listID, tMovieDetailEntity));
  });

  test('should edit list name', () async {
    // arrange
    when(dataSource.editListName(listID: listID, newTitle: tNewTitle))
        .thenAnswer((_) async => true);
    // act
    final result = await repository.editListName(
      listID: listID,
      newTitle: tNewTitle,
    );
    // assert
    expect(result, const Right(true));
    verify(dataSource.editListName(
      listID: listID,
      newTitle: tNewTitle,
    ));
  });
}
