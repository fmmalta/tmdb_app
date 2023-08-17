import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie_app/features/login/data/datasources/authentication_remote_data_source.dart';
import 'package:movie_app/features/login/data/models/session_model.dart';

import '../repository/authentication_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRemoteDataSource>()])
void main() {
  late MockAuthenticationRemoteDataSource datasource;
  setUp(() {
    datasource = MockAuthenticationRemoteDataSource();
  });

  const tUsername = 'maltafellipe';
  const tPassword = 'logitech123';
  const tRequestToken = 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec';

  final tSession = SessionModel(
    requestToken: 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec',
    expiresAt: DateTime.now(),
  );

  test('should request token', () async {
    //arrange
    when(datasource.requestToken()).thenAnswer((_) async => tRequestToken);
    //act
    final result = await datasource.requestToken();
    //assert
    expect(result, tRequestToken);
    verify(datasource.requestToken());
  });

  test('should create session with login', () async {
    //arrange
    when(datasource.createSessionWithLogin(
            username: tUsername,
            password: tPassword,
            requestToken: tRequestToken))
        .thenAnswer(
      (_) async => tSession,
    );
    //act
    final result = await datasource.createSessionWithLogin(
      username: tUsername,
      password: tPassword,
      requestToken: tRequestToken,
    );
    //assert
    expect(result, tSession);
    verify(datasource.createSessionWithLogin(
      username: tUsername,
      password: tPassword,
      requestToken: tRequestToken,
    ));
  });
}
