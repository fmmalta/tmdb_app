import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

abstract class MoviesRemoteRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies();

  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);
}
