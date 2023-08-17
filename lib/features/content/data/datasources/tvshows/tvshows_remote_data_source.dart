import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/content/data/models/tvshows_model.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

class TVShowsRemoteDataSource {
  final HttpService _httpService;

  TVShowsRemoteDataSource(this._httpService);

  Future<List<TVShowsEntity>> getTVShows() async {
    final tvShows = <TVShowsEntity>[];
    final response = await _httpService.get(
      BASE_URL + TVSHOWS_POPULAR_PATH,
      headers: <String, dynamic>{
        'accept': 'application/json',
        'authorization': TOKEN
      },
    );
    if (response.data != null) {
      if (response.data['results'] != null &&
          response.data['results'].isNotEmpty) {
        for (Map<String, dynamic> tvShow in response.data['results']) {
          tvShows.add(TVShowsModel.fromJson(tvShow).toEntity());
        }
      }
    }
    return tvShows;
  }

  Future<List<TVShowsEntity>> searchTVShows(String query) async {
    final tvShows = <TVShowsEntity>[];
    final response = await _httpService.get(
      BASE_URL + tvShowSearchPath(query),
      headers: <String, dynamic>{
        'accept': 'application/json',
        'authorization': TOKEN
      },
    );
    if (response.data != null) {
      if (response.data['results'] != null &&
          response.data['results'].isNotEmpty) {
        for (Map<String, dynamic> tvShow in response.data['results']) {
          tvShows.add(TVShowsModel.fromJson(tvShow).toEntity());
        }
      }
    }
    return tvShows;
  }
}
