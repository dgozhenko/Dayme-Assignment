import 'package:dayme_assignment/domain/responses/game_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'game_api_client.g.dart';

@RestApi()
abstract class GameApiClient {
  factory GameApiClient(Dio dio, {String? baseUrl}) = _GameApiClient;

  @GET('/game')
  Future<dynamic> getGames();
}
