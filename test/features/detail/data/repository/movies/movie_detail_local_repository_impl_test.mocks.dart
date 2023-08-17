// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/detail/data/repository/movies/movie_detail_local_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/features/detail/data/datasources/movie/movie_local_remote_data_source.dart'
    as _i2;
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart'
    as _i4;

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

/// A class which mocks [MovieDetailLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailLocalDataSource extends _i1.Mock
    implements _i2.MovieDetailLocalDataSource {
  @override
  _i3.Future<_i4.MovieDetailEntity?> getLocalMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLocalMovieDetail,
          [id],
        ),
        returnValue: _i3.Future<_i4.MovieDetailEntity?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.MovieDetailEntity?>.value(),
      ) as _i3.Future<_i4.MovieDetailEntity?>);
  @override
  _i3.Future<bool> storeMovieDetail(_i4.MovieDetailEntity? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeMovieDetail,
          [movie],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
