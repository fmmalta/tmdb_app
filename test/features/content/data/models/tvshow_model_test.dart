import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/content/data/models/tvshows_model.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

void main() {
  final tTVShowsModel = TVShowsModel(
    id: 1,
    originalLanguage: 'en',
    overview: 'overview',
    posterPath: 'posterPath',
    firstAirDate: DateTime.now(),
    name: 'name',
    originalName: 'originalName',
  );
  group('TVShowsModel', () {
    test('should be a subclass of TVShowsEntity', () {
      expect(tTVShowsModel, isA<TVShowsEntity>());
    });

    test('should convert to and from a JSON map', () {
      final jsonMap = tTVShowsModel.toJson();
      final result = TVShowsModel.fromJson(jsonMap);
      expect(result, tTVShowsModel);
    });

    test('should convert to and from a TVShowsEntity', () {
      final entity = tTVShowsModel.toEntity();
      final result = TVShowsModel.fromEntity(entity);
      expect(result, tTVShowsModel);
    });
  });
}
