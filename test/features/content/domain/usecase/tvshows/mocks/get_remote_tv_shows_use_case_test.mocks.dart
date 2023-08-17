// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/content/domain/usecase/tvshows/get_remote_tv_shows_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/failure.dart' as _i5;
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart'
    as _i6;
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart'
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

/// A class which mocks [TVShowsRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVShowsRemoteRepository extends _i1.Mock
    implements _i3.TVShowsRemoteRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>> getTVShows() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVShows,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TVShowsEntity>>(
          this,
          Invocation.method(
            #getTVShows,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TVShowsEntity>>(
          this,
          Invocation.method(
            #getTVShows,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>> searchTvShows(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvShows,
          [query],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TVShowsEntity>>(
          this,
          Invocation.method(
            #searchTvShows,
            [query],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TVShowsEntity>>(
          this,
          Invocation.method(
            #searchTvShows,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVShowsEntity>>>);
}
