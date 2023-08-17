import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';

abstract class MovieDetailLocalRepository {
  Future<Either<Failure, bool>> storeMovieDetail(MovieDetailEntity movieDetail);

  Future<Either<Failure, MovieDetailEntity?>> getLocalMovieDetail(int id);
}
