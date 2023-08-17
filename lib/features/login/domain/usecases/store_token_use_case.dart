import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';

class StoreTokenUseCase {
  final AuthenticationRepository repository;

  StoreTokenUseCase(this.repository);

  Future<Either<Failure, bool>> storeToken(String token) async {
    return await repository.storeToken(token);
  }
}
