import 'package:hive/hive.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameCacheService {
  static const String _boxName = 'games';
  static const String _gamesKey = 'all_games';

  Future<void> init() async {
    Hive.registerAdapter(GameResponseAdapter());
    await Hive.openBox<List<GameResponse>>(_boxName);
  }

  Future<List<GameResponse>?> getCachedGames() async {
    final box = Hive.box<List>(_boxName);
    final games = box.get(_gamesKey);
    return games?.cast<GameResponse>();
  }

  Future<void> cacheGames(List<GameResponse> games) async {
    final box = Hive.box<List>(_boxName);
    await box.put(_gamesKey, games);
  }

  Future<void> clearCache() async {
    final box = Hive.box<List>(_boxName);
    await box.clear();
  }
}
