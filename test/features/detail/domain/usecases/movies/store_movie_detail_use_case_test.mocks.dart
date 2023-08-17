// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/detail/domain/usecases/movies/store_movie_detail_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/failure.dart' as _i5;
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart'
    as _i6;
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_local_repository.dart'
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

/// A class which mocks [MovieDetailLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailLocalRepository extends _i1.Mock
    implements _i3.MovieDetailLocalRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> storeMovieDetail(
          _i6.MovieDetailEntity? movieDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeMovieDetail,
          [movieDetail],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #storeMovieDetail,
            [movieDetail],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #storeMovieDetail,
            [movieDetail],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<
      _i2.Either<_i5.Failure, _i6.MovieDetailEntity?>> getLocalMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocalMovieDetail,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MovieDetailEntity?>>.value(
                _FakeEither_0<_i5.Failure, _i6.MovieDetailEntity?>(
          this,
          Invocation.method(
            #getLocalMovieDetail,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MovieDetailEntity?>>.value(
                _FakeEither_0<_i5.Failure, _i6.MovieDetailEntity?>(
          this,
          Invocation.method(
            #getLocalMovieDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MovieDetailEntity?>>);
}
