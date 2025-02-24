import 'package:dayme_assignment/core/utils/network/repository_response.dart';
import 'package:dayme_assignment/domain/requests/game_request.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';

abstract class GameRepository {
  Future<RepositoryResponse<List<GameResponse>, Exception>> getGames();
  Future<RepositoryResponse<void, Exception>> sendReport(GameRequest request);
}
