import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';

class StoreTVShowsUseCase {
  final TVShowsLocalRepository _tvShowsRepository;

  StoreTVShowsUseCase(this._tvShowsRepository);

  Future<Either<Failure, bool>> call(List<TVShowsEntity> tvShows) async {
    return await _tvShowsRepository.storeTVShows(tvShows);
  }
}
