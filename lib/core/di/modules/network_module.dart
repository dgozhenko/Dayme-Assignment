import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  String get baseUrl => 'https://dayme.com.ua';

  @singleton
  Dio dio(
    @Named('base_url') String baseUrl,
  ) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json,
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

  // ? REST API clients
  @singleton
  GameApiClient gameClient(Dio dio, @Named('base_url') String baseUrl) {
    return GameApiClient(dio, baseUrl: baseUrl);
  }
}
