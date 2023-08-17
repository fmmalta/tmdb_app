// Mocks generated by Mockito 5.4.2 from annotations
// in movie_app/test/features/login/domain/usecase/request_token_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/failure.dart' as _i5;
import 'package:movie_app/features/login/domain/entities/session_entity.dart'
    as _i6;
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart'
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

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>
      createSessionWithLogin({
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
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>.value(
                    _FakeEither_0<_i5.Failure, _i6.SessionEntity>(
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
          ) as _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> requestToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #requestToken,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #requestToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> storeToken(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeToken,
          [token],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #storeToken,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>
      createSessionWithLogin({
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
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>.value(
                    _FakeEither_0<_i5.Failure, _i6.SessionEntity>(
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
          ) as _i4.Future<_i2.Either<_i5.Failure, _i6.SessionEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> requestToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #requestToken,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #requestToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> storeToken(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeToken,
          [token],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #storeToken,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
