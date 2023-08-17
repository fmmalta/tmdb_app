import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/detail/data/models/movie_detail_model.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';

class MovieDetailRemoteDataSource {
  final HttpService httpService;

  MovieDetailRemoteDataSource(this.httpService);

  Future<MovieDetailEntity> getMovieDetail(int id) async {
    final response = await httpService.get(BASE_URL + movieDetailPath(id));
    if (response.data != null) {
      return MovieDetailModel.fromJson(response.data).toEntity();
    } else {
      throw Exception('Error getting movie detail');
    }
  }
}
