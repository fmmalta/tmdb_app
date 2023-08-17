import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';

class RequestTokenUseCase {
  final AuthenticationRepository authenticationRepository;

  RequestTokenUseCase(this.authenticationRepository);

  Future<Either<Failure, String>> call() async {
    return await authenticationRepository.requestToken();
  }
}
