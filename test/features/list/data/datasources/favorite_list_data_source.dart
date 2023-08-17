import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/list/data/datasources/favorite_list_data_source.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:uuid/uuid.dart';

import 'favorite_list_data_source.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteListDataSource>()])
void main() {
  late FavoriteListDataSource dataSource;

  setUp(() {
    dataSource = MockFavoriteListDataSource();
  });

  final tDefaultList = FavoriteListEntity(
    listContent: [
      FavoriteListItemEntity(
        uuid: const Uuid().v4(),
        listTitle: 'New List',
        content: {},
      )
    ],
  );

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

  const String tTitle = "Minha lista";
  const String tNewTitle = "Minha lista";

  group('getFavoriteList', () {
    test(
        'should return an empty list when the shared preferences does not contain the key',
        () async {
      when(dataSource.getFavoriteList()).thenAnswer(
        (_) async => FavoriteListEntity(listContent: []),
      );

      final result = await dataSource.getFavoriteList();

      expect(result, equals(FavoriteListEntity(listContent: [])));
    });

    test(
        'should return a list of favorite list items when the shared preferences contains the key',
        () async {
      when(dataSource.getFavoriteList()).thenAnswer((_) async => tDefaultList);

      final result = await dataSource.getFavoriteList();

      expect(result, equals(tDefaultList));
    });
  });

  group('createFavoriteList', () {
    test('should return false when the shared preferences fails to write',
        () async {
      when(dataSource.createFavoriteList(tTitle)).thenThrow(Exception());

      expect(() => dataSource.createFavoriteList(tTitle), throwsException);
    });

    test(
        'should add a new favorite list item to the list and save it to the shared preferences',
        () async {
      when(dataSource.createFavoriteList(tTitle)).thenAnswer((_) async => true);

      final result = await dataSource.createFavoriteList(tTitle);

      expect(result, isTrue);
      verify(dataSource.createFavoriteList(tTitle));
    });
  });

  group('deleteFavoriteList', () {
    test('should return false when the shared preferences fails to write',
        () async {
      when(dataSource.deleteFavoriteList(tTitle)).thenThrow(Exception());

      expect(() => dataSource.deleteFavoriteList(tTitle), throwsException);
    });

    test(
        'should remove the favorite list item with the given id from the list and save it to the shared preferences',
        () async {
      String listID = tDefaultList.listContent.first.uuid;
      when(dataSource.deleteFavoriteList(listID)).thenAnswer((_) async => true);

      final result = await dataSource.deleteFavoriteList(listID);

      expect(result, isTrue);
      verify(dataSource.deleteFavoriteList(listID));
    });
  });

  group('addContentToList', () {
    test('should add content to the correct list', () async {
      // arrange
      String listID = tDefaultList.listContent.first.uuid;
      when(dataSource.addContentToList(listID, tMovieDetailEntity)).thenAnswer(
        (_) async => true,
      );

      // act
      final result = await dataSource.addContentToList(
        listID,
        tMovieDetailEntity,
      );

      // assert
      expect(result, true);
      verify(dataSource.addContentToList(listID, tMovieDetailEntity));
    });
  });

  group('removeContentFromList', () {
    test('should remove content from the correct list', () async {
      // arrange
      String listID = tDefaultList.listContent.first.uuid;
      when(dataSource.removeContentFromList(listID, tMovieDetailEntity))
          .thenAnswer(
        (_) async => true,
      );

      // act
      final result =
          await dataSource.removeContentFromList(listID, tMovieDetailEntity);

      // assert
      expect(result, true);
      verify(dataSource.removeContentFromList(listID, tMovieDetailEntity));
    });
  });

  group('editListName', () {
    test('should edit the list name', () async {
      // arrange
      String listID = tDefaultList.listContent.first.uuid;
      when(dataSource.editListName(listID: listID, newTitle: tNewTitle))
          .thenAnswer(
        (_) async => true,
      );

      // act
      final result = await dataSource.editListName(
        listID: listID,
        newTitle: tNewTitle,
      );

      // assert
      expect(result, true);
      verify(dataSource.editListName(listID: listID, newTitle: tNewTitle));
    });
  });
}
