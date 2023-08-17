import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';

class SearchTVShowsUseCase {
  final TVShowsRemoteRepository repository;

  SearchTVShowsUseCase(this.repository);

  Future<Either<Failure, List<TVShowsEntity>>> call(String query) async {
    return await repository.searchTvShows(query);
  }
}
