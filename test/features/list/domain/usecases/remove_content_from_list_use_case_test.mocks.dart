// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/list/domain/usecases/remove_content_from_list_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/failure.dart' as _i5;
import 'package:movie_app/features/detail/domain/entities/content_interface.dart'
    as _i7;
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart'
    as _i6;
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart'
    as _i3;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FavoriteListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteListRepository extends _i1.Mock
    implements _i3.FavoriteListRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.FavoriteListEntity>>
      getFavoriteLists() => (super.noSuchMethod(
            Invocation.method(
              #getFavoriteLists,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, _i6.FavoriteListEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.FavoriteListEntity>(
              this,
              Invocation.method(
                #getFavoriteLists,
                [],
              ),
            )),
            returnValueForMissingStub: _i4
                .Future<_i2.Either<_i5.Failure, _i6.FavoriteListEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.FavoriteListEntity>(
              this,
              Invocation.method(
                #getFavoriteLists,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i6.FavoriteListEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> createFavoriteList(String? title) =>
      (super.noSuchMethod(
        Invocation.method(
          #createFavoriteList,
          [title],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #createFavoriteList,
            [title],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #createFavoriteList,
            [title],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> deleteFavoriteList(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteList,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #deleteFavoriteList,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #deleteFavoriteList,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> addContentToList(
    String? listID,
    _i7.Content? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addContentToList,
          [
            listID,
            content,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #addContentToList,
            [
              listID,
              content,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #addContentToList,
            [
              listID,
              content,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> removeContentFromList(
    String? listID,
    _i7.Content? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeContentFromList,
          [
            listID,
            content,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #removeContentFromList,
            [
              listID,
              content,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #removeContentFromList,
            [
              listID,
              content,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> editListName({
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
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #editListName,
            [],
            {
              #listID: listID,
              #newTitle: newTitle,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #editListName,
            [],
            {
              #listID: listID,
              #newTitle: newTitle,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
