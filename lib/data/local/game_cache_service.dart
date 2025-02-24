import 'package:hive/hive.dart';
import 'package:dayme_assignment/domain/responses/game_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameCacheService {
  static const String boxName = 'games';
  Box<GameResponse>? _box;

  Future<void> init() async {
    print('init box ${_box}');
    if (!Hive.isAdapterRegistered(0)) {
      // 0 is the typeId from GameResponse
      Hive.registerAdapter(GameResponseAdapter());
    }

    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<GameResponse>(boxName);
    }
  }

  Future<List<GameResponse>> getGames() async {
    await init();
    print('getGames: ${_box?.values.toList()}');
    return _box?.values.toList() ?? [];
  }

  Future<void> saveGames(List<GameResponse> games) async {
    await init();
    await _box?.clear();
    for (final game in games) {
      await _box?.add(game);
    }
  }

  Future<void> dispose() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }
}
