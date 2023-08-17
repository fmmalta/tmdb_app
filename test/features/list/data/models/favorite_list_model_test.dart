import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/content/data/models/movie_model.dart';
import 'package:movie_app/features/content/data/models/tvshows_model.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/list/data/models/favorite_list_model.dart';

void main() {
  final model = FavoriteListModel(
    [
      FavoriteListItemModel(
        listTitle: 'List 1',
        content: <Content>{
          MovieModel(
            id: 550,
            originalLanguage: 'en',
            overview:
                'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
            posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
            releaseDate: DateTime.parse('1999-10-15'),
            title: 'Fight Club',
          ),
        },
      ),
      FavoriteListItemModel(
        listTitle: 'List 2',
        content: <Content>{
          TVShowsModel(
            firstAirDate: DateTime.parse('2008-01-20'),
            id: 1396,
            name: 'Breaking Bad',
            originalLanguage: 'en',
            originalName: 'Breaking Bad',
            overview:
                'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.',
            posterPath: '/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg',
          ),
        },
      ),
    ],
  );
  group('FavoriteListModel', () {
    test('toJson and fromJson', () {
      final json = model.toJson();
      expect(json, {
        'listContent': [
          {
            'listTitle': 'List 1',
            'content': [
              {
                'id': 550,
                'original_language': 'en',
                'overview':
                    'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
                'poster_path': '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                'release_date': '1999-10-15T00:00:00.000',
                'title': 'Fight Club'
              }
            ],
            'id': null
          },
          {
            'listTitle': 'List 2',
            'content': [
              {
                'id': 1396,
                'original_language': 'en',
                'overview':
                    'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.',
                'poster_path': '/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg',
                'first_air_date': '2008-01-20T00:00:00.000',
                'name': 'Breaking Bad',
                'original_name': 'Breaking Bad'
              }
            ],
            'id': null
          }
        ]
      });

      final parsedModel = FavoriteListModel.fromJson(json);
      expect(parsedModel, model);
    });

    test('encode and decode', () {
      final encoded = model.toJson();
      final decoded = FavoriteListModel.fromJson(encoded);
      expect(decoded, model);
    });
  });
}
