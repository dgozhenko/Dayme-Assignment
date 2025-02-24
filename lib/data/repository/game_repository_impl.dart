import 'package:dayme_assignment/core/utils/network/repository_response.dart';
import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';

class GameRepositoryImpl implements GameRepository {
  final GameApiClient _gameApiClient;

  GameRepositoryImpl(this._gameApiClient);

  @override
  Future<RepositoryResponse<List<GameResponse>, Exception>> getGames() async {
    try {
      final response = await _gameApiClient.getGames();
      return RepositoryResponse.success(data: response);
    } catch (e) {
      return RepositoryResponse.error(error: e as Exception);
    }
  }
}
