import 'package:dayme_assignment/domain/requests/game_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'game_api_client.g.dart';

@RestApi()
abstract class GameApiClient {
  factory GameApiClient(Dio dio, {String? baseUrl}) = _GameApiClient;

  @GET('/game')
  Future<dynamic> getGames();

  @POST('/game/')
  Future<dynamic> sendReport(@Body() GameRequest request);
}
