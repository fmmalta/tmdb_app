import 'dart:convert';

import 'package:movie_app/features/detail/data/models/tv_show_detail_model.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TVShowDetailLocalDataSource {
  final SharedPreferences _preferences;

  TVShowDetailLocalDataSource(this._preferences);

  Future<bool> storeTVShowDetail(TVShowDetailEntity entity) async {
    return await _preferences.setString(
      'tv_show_detail${entity.id}',
      json.encode(TVShowDetailModel.fromEntity(entity).toJson()),
    );
  }

  Future<TVShowDetailEntity?> getLocalTVShowDetail(int id) async {
    final String? jsonString = _preferences.getString('tv_show_detail$id');
    if (jsonString == null) return null;
    return TVShowDetailModel.fromJson(json.decode(jsonString)).toEntity();
  }
}
