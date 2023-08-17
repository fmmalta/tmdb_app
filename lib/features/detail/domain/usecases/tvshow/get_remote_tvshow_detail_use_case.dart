import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';

import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_remote_detail_repository.dart';

class GetRemoteTVShowDetailUseCase {
  final TVShowDetailRemoteRepository remoteRepository;

  GetRemoteTVShowDetailUseCase(this.remoteRepository);

  Future<Either<Failure, TVShowDetailEntity>> call(int id) async {
    return await remoteRepository.getTVShowDetail(id);
  }
}
