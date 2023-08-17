import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';

class SearchMoviesUseCase {
  final MoviesRemoteRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
