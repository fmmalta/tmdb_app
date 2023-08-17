import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';
import 'package:movie_app/features/login/domain/usecases/create_session_use_case.dart';

import 'create_session_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRepository>()])
void main() {
  late CreateSessionUseCase usecase;
  late MockAuthenticationRepository mockAuthenticationRepository;

  final tSession = SessionEntity(
    requestToken: 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec',
    expiresAt: DateTime.now(),
  );

  const username = 'maltafellipe';
  const password = 'logitech123';
  const requestToken = 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec';

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = CreateSessionUseCase(mockAuthenticationRepository);
  });

  test('should call authenticationRepository with correct params', () async {
    // act
    await usecase(
      username: username,
      password: password,
      requestToken: requestToken,
    );

    // assert
    verify(
      mockAuthenticationRepository.createSessionWithLogin(
        username: username,
        password: password,
        requestToken: requestToken,
      ),
    ).called(1);
  });

  test('should get a session entity from repository', () async {
    when(mockAuthenticationRepository.createSessionWithLogin(
      username: username,
      password: password,
      requestToken: requestToken,
    )).thenAnswer((_) async => Right(tSession));

    final result = await usecase(
      username: username,
      password: password,
      requestToken: requestToken,
    );

    expect(result, Right(tSession));
  });
}
