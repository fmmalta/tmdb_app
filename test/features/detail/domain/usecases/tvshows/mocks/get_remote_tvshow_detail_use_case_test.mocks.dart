// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/detail/domain/usecases/tvshows/get_remote_tvshow_detail_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/failure.dart' as _i5;
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart'
    as _i6;
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_remote_detail_repository.dart'
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

/// A class which mocks [TVShowDetailRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVShowDetailRemoteRepository extends _i1.Mock
    implements _i3.TVShowDetailRemoteRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.TVShowDetailEntity>> getTVShowDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVShowDetail,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.TVShowDetailEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.TVShowDetailEntity>(
          this,
          Invocation.method(
            #getTVShowDetail,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.TVShowDetailEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.TVShowDetailEntity>(
          this,
          Invocation.method(
            #getTVShowDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.TVShowDetailEntity>>);
}
