import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, SessionEntity>> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  });

  Future<Either<Failure, String>> requestToken();

  Future<Either<Failure, bool>> storeToken(String token);
}
