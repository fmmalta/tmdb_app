import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/detail/data/models/tv_show_detail_model.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

class TVShowDetailRemoteDataSource {
  final HttpService httpService;

  TVShowDetailRemoteDataSource(this.httpService);

  Future<TVShowDetailEntity?> getTVShowDetail(int id) async {
    final response = await httpService.get(BASE_URL + tvShowDetailPath(id));
    if (response.data != null) {
      return TVShowDetailModel.fromJson(response.data).toEntity();
    } else {
      throw Exception("TV Show Detail not found");
    }
  }
}
