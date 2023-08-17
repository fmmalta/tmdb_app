import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';
import 'package:movie_app/features/login/domain/usecases/request_token_use_case.dart';

import 'request_token_use_case_test.mocks.dart';

@GenerateMocks([
  AuthenticationRepository
], customMocks: [
  MockSpec<AuthenticationRepository>(as: #MockAuthRepository),
])
void main() {
  late RequestTokenUseCase requestTokenUseCase;
  late MockAuthenticationRepository mockAuthenticationRepository;
  const requestToken = 'a0d41e219eb24e63f14a2ba65d87331d61dcfeec';

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    requestTokenUseCase = RequestTokenUseCase(mockAuthenticationRepository);
  });

  test('should request token', () async {
    // arrange
    when(mockAuthenticationRepository.requestToken())
        .thenAnswer((_) async => const Right(requestToken));
    // act
    final token = await requestTokenUseCase();
    // assert
    expect(token, const Right(requestToken));
    verify(mockAuthenticationRepository.requestToken()).called(1);
  });
}
