import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_local_data_source.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_local_detail_repository.dart';

class TVShowLocalDetailRepositoryImpl extends TVShowLocalDetailRepository {
  final TVShowDetailLocalDataSource dataSource;

  TVShowLocalDetailRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, TVShowDetailEntity?>> getLocalTVShowDetail(
      int id) async {
    try {
      final movie = await dataSource.getLocalTVShowDetail(id);
      return Right(movie);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> storeTVShowDetail(
    TVShowDetailEntity tvshow,
  ) async {
    try {
      final stored = await dataSource.storeTVShowDetail(tvshow);
      return Right(stored);
    } catch (error) {
      rethrow;
    }
  }
}
