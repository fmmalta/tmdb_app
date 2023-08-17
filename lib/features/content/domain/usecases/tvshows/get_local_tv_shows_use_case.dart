import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';

class GetLocalTVShowsUseCase {
  final TVShowsLocalRepository _tvShowsRepository;

  GetLocalTVShowsUseCase(this._tvShowsRepository);

  Future<Either<Failure, List<TVShowsEntity>>> call() async {
    return await _tvShowsRepository.getTVShows();
  }
}
