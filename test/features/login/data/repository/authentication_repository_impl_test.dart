// Test code
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/login/data/datasources/authentication_remote_data_source.dart';
import 'package:movie_app/features/login/data/datasources/authentication_local_data_source.dart';
import 'package:movie_app/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthenticationRemoteDataSource>(),
  MockSpec<AuthenticationLocalDataSource>()
])
void main() {
  late AuthenticationRepository repository;
  late AuthenticationRemoteDataSource dataSource;
  late AuthenticationLocalDataSource localDataSource;

  const String username = 'maltafellipe';
  const String password = 'logitech123';
  const String requestToken = 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec';

  final tSession = SessionEntity(
    requestToken: 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec',
    expiresAt: DateTime.now(),
  );

  setUp(() {
    dataSource = MockAuthenticationRemoteDataSource();
    localDataSource = MockAuthenticationLocalDataSource();
    repository = AuthenticationRepositoryImpl(dataSource, localDataSource);
  });

  test('Should create session with login', () async {
    // arrange
    when(dataSource.createSessionWithLogin(
      username: username,
      password: password,
      requestToken: requestToken,
    )).thenAnswer((_) async => tSession);

    // act
    final result = await repository.createSessionWithLogin(
      username: username,
      password: password,
      requestToken: requestToken,
    );

    // assert
    expect(result, Right(tSession));
    verify(dataSource.createSessionWithLogin(
      username: username,
      password: password,
      requestToken: requestToken,
    ));
  });

  test('Should request token', () async {
    // arrange
    when(dataSource.requestToken()).thenAnswer((_) async => requestToken);

    // act
    final result = await repository.requestToken();

    // assert
    expect(result, const Right(requestToken));
    verify(dataSource.requestToken());
  });

  test('should store token', () async {
    // arrange
    when(localDataSource.storeToken(requestToken)).thenAnswer(
      (_) async => true,
    );
    // act
    final result = await repository.storeToken(requestToken);
    // assert
    expect(result, const Right(true));
    verify(localDataSource.storeToken(requestToken));
    verifyNoMoreInteractions(localDataSource);
  });
}
