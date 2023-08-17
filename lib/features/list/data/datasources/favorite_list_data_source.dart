import 'dart:convert';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/list/data/models/favorite_list_model.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FavoriteListDataSource {
  final SharedPreferences _preferences;

  FavoriteListDataSource(this._preferences);

  final String _key = 'favorite_content';

  String encodedList(List<FavoriteListItemModel> list) => json.encode(
        list.map<Map<String, dynamic>>((model) => model.toJson()).toList(),
      );

  List<FavoriteListItemModel> decodeList(String rawValue) {
    return (json.decode(rawValue) as List<dynamic>)
        .map<FavoriteListItemModel>(
            (item) => FavoriteListItemModel.fromJson(item))
        .toList();
  }

  Future<FavoriteListEntity> getFavoriteList() async {
    if (_preferences.containsKey(_key)) {
      final decodedFavoriteList =
          decodeList(_preferences.getString(_key) as String);
      return FavoriteListEntity(
        listContent: decodedFavoriteList.map((e) => e.toEntity()).toList(),
      );
    } else {
      return FavoriteListEntity(listContent: []);
    }
  }

  Future<bool> createFavoriteList(String title) async {
    final newFavoriteList = [
      FavoriteListItemModel(
        listTitle: title,
        content: {},
        id: const Uuid().v4(),
      )
    ];

    if (_preferences.containsKey(_key)) {
      final favoriteList = decodeList(_preferences.getString(_key)!);
      favoriteList.addAll(newFavoriteList);
      final encoded = encodedList(favoriteList);
      await _preferences.setString(_key, encoded);
    } else {
      await _preferences.setString(_key, encodedList(newFavoriteList));
    }

    return true;
  }

  Future<bool> deleteFavoriteList(String id) async {
    final favoriteList = decodeList(_preferences.getString(_key)!);

    favoriteList.removeWhere((element) => element.id == id);

    final encoded = encodedList(favoriteList);
    return await _preferences.setString(_key, encoded);
  }

  Future<bool> addContentToList(String listID, Content content) async {
    final favoriteList = decodeList(_preferences.getString(_key)!).toSet();
    final model = favoriteList.firstWhere((element) => element.id == listID);
    if (model.content != null) {
      model.content!.add(content);
    }
    favoriteList.add(model);
    final encoded = encodedList(favoriteList.toSet().toList());
    return await _preferences.setString(_key, encoded);
  }

  Future<bool> removeContentFromList(String listID, Content content) async {
    final favoriteList = decodeList(_preferences.getString(_key)!).toSet();
    final model = favoriteList.firstWhere((element) => element.id == listID);
    if (model.content != null) {
      model.content!.removeWhere((item) => item.id == content.id);
    }
    favoriteList.add(model);
    final encoded = encodedList(favoriteList.toSet().toList());
    return await _preferences.setString(_key, encoded);
  }

  Future<bool> editListName({
    required String listID,
    required String newTitle,
  }) async {
    final favoriteList = decodeList(_preferences.getString(_key)!).toSet();
    final model = favoriteList.firstWhere((element) => element.id == listID);
    model.listTitle = newTitle;
    favoriteList.add(model);
    final encoded = encodedList(favoriteList.toSet().toList());
    return await _preferences.setString(_key, encoded);
  }
}
