import 'dart:convert';
import 'package:movie_app/features/detail/data/models/movie_detail_model.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailLocalDataSource {
  final SharedPreferences _preferences;

  MovieDetailLocalDataSource(this._preferences);

  final String _key = 'detail';

  Future<MovieDetailEntity?> getLocalMovieDetail(int id) async {
    final String? movie = _preferences.getString(_key + id.toString());
    if (movie == null) {
      return null;
    }
    return MovieDetailModel.fromJson(json.decode(movie)).toEntity();
  }

  Future<bool> storeMovieDetail(MovieDetailEntity movie) async {
    return await _preferences.setString(
      _key + movie.id.toString(),
      json.encode(MovieDetailModel.fromEntity(movie).toJson()),
    );
  }
}
