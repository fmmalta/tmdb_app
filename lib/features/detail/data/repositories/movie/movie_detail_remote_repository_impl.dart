import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_detail_remote_data_source.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_remote_repository.dart';

class MovieDetailRemoteRepositoryImpl extends MovieDetailRemoteRepository {
  final MovieDetailRemoteDataSource remoteDataSource;

  MovieDetailRemoteRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final movieDetail = await remoteDataSource.getMovieDetail(id);
      return Right(movieDetail);
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } catch (error) {
      rethrow;
    }
  }
}
