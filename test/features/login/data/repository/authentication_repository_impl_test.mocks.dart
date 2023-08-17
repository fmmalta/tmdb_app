// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/login/data/repository/authentication_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/features/login/data/datasources/authentication_local_data_source.dart'
    as _i6;
import 'package:movie_app/features/login/data/datasources/authentication_remote_data_source.dart'
    as _i4;
import 'package:movie_app/features/login/domain/entities/session_entity.dart'
    as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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

class _FakeSessionEntity_0 extends _i1.SmartFake implements _i2.SessionEntity {
  _FakeSessionEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSharedPreferences_1 extends _i1.SmartFake
    implements _i3.SharedPreferences {
  _FakeSharedPreferences_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRemoteDataSource extends _i1.Mock
    implements _i4.AuthenticationRemoteDataSource {
  @override
  _i5.Future<String> requestToken() => (super.noSuchMethod(
        Invocation.method(
          #requestToken,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
        returnValueForMissingStub: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<_i2.SessionEntity> createSessionWithLogin({
    required String? username,
    required String? password,
    required String? requestToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createSessionWithLogin,
          [],
          {
            #username: username,
            #password: password,
            #requestToken: requestToken,
          },
        ),
        returnValue: _i5.Future<_i2.SessionEntity>.value(_FakeSessionEntity_0(
          this,
          Invocation.method(
            #createSessionWithLogin,
            [],
            {
              #username: username,
              #password: password,
              #requestToken: requestToken,
            },
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.SessionEntity>.value(_FakeSessionEntity_0(
          this,
          Invocation.method(
            #createSessionWithLogin,
            [],
            {
              #username: username,
              #password: password,
              #requestToken: requestToken,
            },
          ),
        )),
      ) as _i5.Future<_i2.SessionEntity>);
}

/// A class which mocks [AuthenticationLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationLocalDataSource extends _i1.Mock
    implements _i6.AuthenticationLocalDataSource {
  @override
  _i3.SharedPreferences get preferences => (super.noSuchMethod(
        Invocation.getter(#preferences),
        returnValue: _FakeSharedPreferences_1(
          this,
          Invocation.getter(#preferences),
        ),
        returnValueForMissingStub: _FakeSharedPreferences_1(
          this,
          Invocation.getter(#preferences),
        ),
      ) as _i3.SharedPreferences);
  @override
  _i5.Future<bool> storeToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #storeToken,
          [token],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}