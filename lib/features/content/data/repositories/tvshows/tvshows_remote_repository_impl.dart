import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_remote_data_source.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';

class TVShowsRemoteRepositoryImpl implements TVShowsRemoteRepository {
  final TVShowsRemoteDataSource remoteDataSource;

  TVShowsRemoteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TVShowsEntity>>> getTVShows() async {
    try {
      final tvshows = await remoteDataSource.getTVShows();
      return Right(tvshows);
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<TVShowsEntity>>> searchTvShows(
    String query,
  ) async {
    try {
      final tvshows = await remoteDataSource.searchTVShows(query);
      return Right(tvshows);
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } catch (error) {
      rethrow;
    }
  }
}
