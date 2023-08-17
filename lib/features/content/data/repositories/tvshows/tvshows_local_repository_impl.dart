import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_local_data_source.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';

class TVShowsLocalRepositoryImpl implements TVShowsLocalRepository {
  final TVShowsLocalDataSource dataSource;

  TVShowsLocalRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<TVShowsEntity>>> getTVShows() async {
    try {
      final tvshows = dataSource.getLocalTVShows();
      return Right(tvshows);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> storeTVShows(
      List<TVShowsEntity> tvShows) async {
    try {
      final stored = await dataSource.storeTVShows(tvShows);
      return Right(stored);
    } catch (error) {
      rethrow;
    }
  }
}
