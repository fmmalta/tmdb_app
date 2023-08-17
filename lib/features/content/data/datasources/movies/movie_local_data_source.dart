import 'dart:convert';

import 'package:movie_app/features/content/data/models/movie_model.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieLocalDataSource {
  final SharedPreferences _preferences;

  MovieLocalDataSource(this._preferences);

  final String _moviesKey = 'movies';

  Future<bool> storeMovies(List<MovieEntity> movies) async {
    return await _preferences.setString(
      _moviesKey,
      json.encode(
        movies.map((e) => MovieModel.fromEntity(e).toJson()).toList(),
      ),
    );
  }

  List<MovieEntity> getLocalMovies() {
    final movies = _preferences.getString(_moviesKey);
    if (movies != null) {
      return (json.decode(movies) as List<dynamic>)
          .map((e) => MovieModel.fromJson(e).toEntity())
          .toList();
    } else {
      return const [];
    }
  }
}
