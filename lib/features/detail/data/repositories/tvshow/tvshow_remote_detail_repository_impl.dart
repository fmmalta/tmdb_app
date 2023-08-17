import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_remote_data_source.dart';

import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_remote_detail_repository.dart';

class TVShowDetailRemoteRepositoryImpl implements TVShowDetailRemoteRepository {
  final TVShowDetailRemoteDataSource dataSource;

  TVShowDetailRemoteRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, TVShowDetailEntity>> getTVShowDetail(int id) async {
    try {
      final result = await dataSource.getTVShowDetail(id);
      return Right(result!);
    } on NoConnectionException catch (_) {
      return const Left(NoConnectionFailure());
    } on APIException catch (error) {
      return Left(APIFailure(error.details));
    } catch (error) {
      rethrow;
    }
  }
}
