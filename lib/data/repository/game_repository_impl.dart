import 'package:dayme_assignment/core/utils/network/repository_response.dart';
import 'package:dayme_assignment/data/local/game_cache_service.dart';
import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';

class GameRepositoryImpl implements GameRepository {
  final GameApiClient _gameApiClient;
  final GameCacheService _cacheService;

  GameRepositoryImpl(this._gameApiClient, this._cacheService);

  @override
  Future<RepositoryResponse<List<GameResponse>, Exception>> getGames() async {
    try {
      // Try to get games from cache first
      final cachedGames = await _cacheService.getCachedGames();
      if (cachedGames != null && cachedGames.isNotEmpty) {
        return RepositoryResponse.success(data: cachedGames);
      }

      // If cache is empty or expired, fetch from API
      final response = await _gameApiClient.getGames();

      // Cache the new data
      await _cacheService.cacheGames(response);

      return RepositoryResponse.success(data: response);
    } catch (e) {
      // If there's an error, try to return cached data as fallback
      final cachedGames = await _cacheService.getCachedGames();
      if (cachedGames != null && cachedGames.isNotEmpty) {
        return RepositoryResponse.success(data: cachedGames);
      }
      return RepositoryResponse.error(error: e as Exception);
    }
  }
}
