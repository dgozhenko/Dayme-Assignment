import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://dayme.com.ua',
        followRedirects: true,
        maxRedirects: 5,
        validateStatus: (status) {
          return status != null && status < 500;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    final prettyLogger = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );
    dio.interceptors.add(prettyLogger);
    return dio;
  }

  @singleton
  GameApiClient provideGameApiClient(Dio dio) => GameApiClient(dio);
}
