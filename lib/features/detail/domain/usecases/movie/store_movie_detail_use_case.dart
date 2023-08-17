import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_local_repository.dart';

class StoreMovieDetailUseCase {
  final MovieDetailLocalRepository localRepository;

  StoreMovieDetailUseCase(this.localRepository);

  Future<Either<Failure, bool>> call(MovieDetailEntity movieDetail) async {
    return await localRepository.storeMovieDetail(movieDetail);
  }
}
