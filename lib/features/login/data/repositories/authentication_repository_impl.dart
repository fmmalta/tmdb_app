import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions.dart';

import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/login/data/datasources/authentication_remote_data_source.dart';
import 'package:movie_app/features/login/data/datasources/authentication_local_data_source.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;

  AuthenticationRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, SessionEntity>> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    try {
      final sessionEntity = await remoteDataSource.createSessionWithLogin(
        username: username,
        password: password,
        requestToken: requestToken,
      );
      return Right(sessionEntity);
    } on APIException catch (error) {
      return Left(APIFailure.invalidUser(error.details));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> requestToken() async {
    try {
      final response = await remoteDataSource.requestToken();
      return Right(response);
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> storeToken(String token) async {
    try {
      final stored = await localDataSource.storeToken(token);
      return Right(stored);
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    }
  }
}
