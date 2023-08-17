import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

abstract class TVShowDetailRemoteRepository {
  Future<Either<Failure, TVShowDetailEntity>> getTVShowDetail(int id);
}
