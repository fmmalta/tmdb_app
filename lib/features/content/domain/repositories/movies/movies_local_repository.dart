import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

abstract class MoviesLocalRepository {
  Future<Either<Failure, bool>> storeMovies(List<MovieEntity> movies);
  Either<Failure, List<MovieEntity>> getMoviesLocally();
}
