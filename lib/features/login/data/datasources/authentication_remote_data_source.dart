import 'package:dio/dio.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/exceptions.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/login/data/models/session_model.dart';
import 'package:movie_app/features/login/domain/entities/session_entity.dart';

class AuthenticationRemoteDataSource {
  final HttpService _httpService;

  AuthenticationRemoteDataSource(this._httpService);

  Future<String> requestToken() async {
    try {
      final response = await _httpService.get(
        BASE_URL + REQUEST_TOKEN_PATH,
        headers: {
          'accept': 'application/json',
          'Authorization': TOKEN,
        },
      );

      return response.data['request_token'];
    } catch (error) {
      rethrow;
    }
  }

  Future<SessionEntity> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    try {
      final response = await _httpService.post<dynamic>(
        BASE_URL + VALIDATE_WITH_LOGIN,
        queryParameters: {
          'api_key': API_KEY,
          'request_token': requestToken,
          'username': username,
          'password': password
        },
      );

      return SessionModel.fromJson(response.data!).toEntity();
    } on DioException catch (error) {
      throw APIException(
        error.response!.data as Map<String, dynamic>,
      );
    } catch (error) {
      rethrow;
    }
  }
}
