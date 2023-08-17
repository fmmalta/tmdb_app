import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';

class StoreMoviesUseCase {
  final MoviesLocalRepository _moviesRepository;

  StoreMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, bool>> call(List<MovieEntity> movies) async {
    return await _moviesRepository.storeMovies(movies);
  }
}
