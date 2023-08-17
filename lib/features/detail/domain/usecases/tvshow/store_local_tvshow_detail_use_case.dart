import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';

import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_local_detail_repository.dart';

class StoreLocalTVShowDetailUseCase {
  final TVShowLocalDetailRepository localRepository;

  StoreLocalTVShowDetailUseCase(this.localRepository);

  Future<Either<Failure, bool>> call(TVShowDetailEntity movieDetail) async {
    return await localRepository.storeTVShowDetail(movieDetail);
  }
}
