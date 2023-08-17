import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_local_remote_data_source.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_local_repository.dart';

class MovieDetailLocalRepositoryImpl extends MovieDetailLocalRepository {
  final MovieDetailLocalDataSource dataSource;

  MovieDetailLocalRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, MovieDetailEntity?>> getLocalMovieDetail(
    int id,
  ) async {
    try {
      final result = await dataSource.getLocalMovieDetail(id);
      return Right(result);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> storeMovieDetail(
    MovieDetailEntity movieDetail,
  ) async {
    try {
      final result = await dataSource.storeMovieDetail(movieDetail);
      return Right(result);
    } catch (error) {
      rethrow;
    }
  }
}
