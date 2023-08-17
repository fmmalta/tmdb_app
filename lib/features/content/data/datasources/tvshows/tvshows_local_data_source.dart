import 'dart:convert';

import 'package:movie_app/features/content/data/models/tvshows_model.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TVShowsLocalDataSource {
  final SharedPreferences preferences;

  TVShowsLocalDataSource(this.preferences);

  final String _tvShowsKey = 'tv_shows';

  Future<bool> storeTVShows(List<TVShowsEntity> tvShows) async {
    return await preferences.setString(
      _tvShowsKey,
      json.encode(
        tvShows.map((e) => TVShowsModel.fromEntity(e).toJson()).toList(),
      ),
    );
  }

  List<TVShowsEntity> getLocalTVShows() {
    final tvShows = preferences.getString(_tvShowsKey);
    if (tvShows != null) {
      return (json.decode(tvShows) as List<dynamic>)
          .map((e) => TVShowsModel.fromJson(e).toEntity())
          .toList();
    } else {
      return const [];
    }
  }
}
