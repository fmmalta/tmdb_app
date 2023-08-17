import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

abstract class TVShowLocalDetailRepository {
  Future<Either<Failure, bool>> storeTVShowDetail(TVShowDetailEntity tvshow);

  Future<Either<Failure, TVShowDetailEntity?>> getLocalTVShowDetail(int id);
}
