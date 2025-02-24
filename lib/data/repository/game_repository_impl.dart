import 'package:dayme_assignment/core/utils/network/repository_response.dart';
import 'package:dayme_assignment/data/local/game_cache_service.dart';
import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:dayme_assignment/domain/requests/game_request.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';

class GameRepositoryImpl implements GameRepository {
  final GameApiClient _gameApiClient;
  final GameCacheService _cacheService;

  GameRepositoryImpl(this._gameApiClient, this._cacheService);

  @override
  Future<RepositoryResponse<List<GameResponse>, Exception>> getGames() async {
    try {
      // Try to get games from cache first
      final cachedGames = await _cacheService.getGames();
      if (cachedGames.isNotEmpty) {
        return RepositoryResponse.success(data: cachedGames);
      }

      // If cache is empty or expired, fetch from API
      final response = await _gameApiClient.getGames();

      if (response == null) {
        throw Exception('Немає продуктів');
      }

      final List<GameResponse> games = (response as List<dynamic>)
          .expand((group) => (group as List<dynamic>))
          .map((item) => GameResponse.fromJson(item as Map<String, dynamic>))
          .toList();

      // Cache the new data
      await _cacheService.saveGames(games);

      return RepositoryResponse.success(data: games);
    } catch (e) {
      // If there's an error, try to return cached data as fallback
      try {
        final cachedGames = await _cacheService.getGames();
        if (cachedGames.isNotEmpty) {
          return RepositoryResponse.success(data: cachedGames);
        }
      } catch (_) {
        // Ignore cache errors in error handling
      }

      return RepositoryResponse.error(
        error: Exception('Помилка'),
      );
    }
  }

  @override
  Future<RepositoryResponse<void, Exception>> sendReport(
      GameRequest request) async {
    try {
      await _gameApiClient.sendReport(request);
      await _cacheService.clearGames();
      return RepositoryResponse.success();
    } catch (e) {
      return RepositoryResponse.error(error: Exception(e.toString()));
    }
  }
}
