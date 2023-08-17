import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/content/data/models/movie_model.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

class MovieRemoteDataSource {
  final HttpService _httpService;
  MovieRemoteDataSource(this._httpService);

  Future<List<MovieEntity>> getMovies() async {
    final movies = <MovieEntity>[];
    final response = await _httpService.get(BASE_URL + MOVIES_NOW_PLAYING_PATH,
        headers: <String, dynamic>{
          'accept': 'application/json',
          'authorization': TOKEN
        });

    if (response.data != null) {
      if (response.data['results'] != null &&
          response.data['results'].isNotEmpty) {
        for (Map<String, dynamic> movie in response.data['results']) {
          movies.add(MovieModel.fromJson(movie).toEntity());
        }
      }
    }
    return movies;
  }

  Future<List<MovieEntity>> searchMovies(String query) async {
    final movies = <MovieEntity>[];
    final response = await _httpService.get(BASE_URL + movieSearchPath(query),
        headers: <String, dynamic>{
          'accept': 'application/json',
          'authorization': TOKEN
        });

    if (response.data != null) {
      if (response.data['results'] != null &&
          response.data['results'].isNotEmpty) {
        for (Map<String, dynamic> movie in response.data['results']) {
          movies.add(MovieModel.fromJson(movie).toEntity());
        }
      }
    }
    return movies;
  }
}
