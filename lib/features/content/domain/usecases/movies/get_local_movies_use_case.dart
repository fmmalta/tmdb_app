import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';

class GetLocalMoviesUseCase {
  final MoviesLocalRepository repository;

  GetLocalMoviesUseCase(this.repository);

  Future<Either<Failure, bool>> storeMoviesLocally(
    List<MovieEntity> movies,
  ) async {
    return await repository.storeMovies(movies);
  }

  Either<Failure, List<MovieEntity>> getMoviesLocally() {
    return repository.getMoviesLocally();
  }
}
