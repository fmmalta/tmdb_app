import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

abstract class TVShowsRemoteRepository {
  Future<Either<Failure, List<TVShowsEntity>>> getTVShows();

  Future<Either<Failure, List<TVShowsEntity>>> searchTvShows(String query);
}
