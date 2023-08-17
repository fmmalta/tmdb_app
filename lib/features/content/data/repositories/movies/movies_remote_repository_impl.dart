import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_remote_data_source.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';

class MoviesRemoteRepositoryImpl implements MoviesRemoteRepository {
  final MovieRemoteDataSource remoteDataSource;

  MoviesRemoteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      final movies = await remoteDataSource.getMovies();
      return Right(movies);
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      final movies = await remoteDataSource.searchMovies(query);
      return Right(movies);
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } catch (error) {
      rethrow;
    }
  }
}
