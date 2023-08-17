import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_local_data_source.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';

class MoviesLocalRepositoryImpl extends MoviesLocalRepository {
  final MovieLocalDataSource _dataSource;

  MoviesLocalRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, bool>> storeMovies(List<MovieEntity> movies) async {
    try {
      final stored = await _dataSource.storeMovies(movies);
      return Right(stored);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Either<Failure, List<MovieEntity>> getMoviesLocally() {
    try {
      final movies = _dataSource.getLocalMovies();
      return Right(movies);
    } catch (error) {
      rethrow;
    }
  }
}
