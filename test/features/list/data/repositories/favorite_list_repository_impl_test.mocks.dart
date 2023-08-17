// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/list/data/repositories/favorite_list_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart'
    as _i6;
import 'package:movie_app/features/list/data/datasources/favorite_list_data_source.dart'
    as _i3;
import 'package:movie_app/features/list/data/models/favorite_list_model.dart'
    as _i4;
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFavoriteListEntity_0 extends _i1.SmartFake
    implements _i2.FavoriteListEntity {
  _FakeFavoriteListEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FavoriteListDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteListDataSource extends _i1.Mock
    implements _i3.FavoriteListDataSource {
  MockFavoriteListDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String encodedList(List<_i4.FavoriteListItemModel>? list) =>
      (super.noSuchMethod(
        Invocation.method(
          #encodedList,
          [list],
        ),
        returnValue: '',
      ) as String);
  @override
  List<_i4.FavoriteListItemModel> decodeList(String? rawValue) =>
      (super.noSuchMethod(
        Invocation.method(
          #decodeList,
          [rawValue],
        ),
        returnValue: <_i4.FavoriteListItemModel>[],
      ) as List<_i4.FavoriteListItemModel>);
  @override
  _i5.Future<_i2.FavoriteListEntity> getFavoriteList() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteList,
          [],
        ),
        returnValue:
            _i5.Future<_i2.FavoriteListEntity>.value(_FakeFavoriteListEntity_0(
          this,
          Invocation.method(
            #getFavoriteList,
            [],
          ),
        )),
      ) as _i5.Future<_i2.FavoriteListEntity>);
  @override
  _i5.Future<bool> createFavoriteList(String? title) => (super.noSuchMethod(
        Invocation.method(
          #createFavoriteList,
          [title],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> deleteFavoriteList(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteList,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> addContentToList(
    String? listID,
    _i6.Content? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addContentToList,
          [
            listID,
            content,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> removeContentFromList(
    String? listID,
    _i6.Content? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeContentFromList,
          [
            listID,
            content,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> editListName({
    required String? listID,
    required String? newTitle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #editListName,
          [],
          {
            #listID: listID,
            #newTitle: newTitle,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
