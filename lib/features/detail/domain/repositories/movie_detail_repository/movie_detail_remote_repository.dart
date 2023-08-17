import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';

abstract class MovieDetailRemoteRepository {
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id);
}
