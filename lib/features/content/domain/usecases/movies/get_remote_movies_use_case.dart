import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';

import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';

class GetRemoteMoviesUseCase {
  final MoviesRemoteRepository _movieRepository;

  GetRemoteMoviesUseCase(this._movieRepository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await _movieRepository.getMovies();
  }
}
