import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';

class CreateSessionUseCase {
  final AuthenticationRepository authenticationRepository;
  CreateSessionUseCase(this.authenticationRepository);

  Future<Either<Failure, SessionEntity>> call({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    return await authenticationRepository.createSessionWithLogin(
      username: username,
      password: password,
      requestToken: requestToken,
    );
  }
}
