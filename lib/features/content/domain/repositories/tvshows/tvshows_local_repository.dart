import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';

abstract class TVShowsLocalRepository {
  Future<Either<Failure, bool>> storeTVShows(List<TVShowsEntity> tvShows);

  Future<Either<Failure, List<TVShowsEntity>>> getTVShows();
}
