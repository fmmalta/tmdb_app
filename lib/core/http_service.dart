import 'package:dio/dio.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/exceptions.dart';

class HttpService {
  final Dio dio = Dio();

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers ??
              <String, dynamic>{
                'accept': 'application/json',
                'authorization': TOKEN
              },
        ),
      );
      return response;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.unknown) {
        throw NoConnectionException();
      } else {
        throw APIException(error.response!.data);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<T> response = await dio.post<T>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (error) {
      throw APIException(error.response!.data!);
    }
  }
}
