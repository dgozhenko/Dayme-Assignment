import 'package:collection/collection.dart';
import 'package:dayme_assignment/data/local/game_cache_service.dart';
import 'package:dayme_assignment/domain/model/game.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository _gameRepository;
  final GameCacheService _gameCacheService;

  GameBloc(this._gameRepository, this._gameCacheService)
      : super(GameState(
          stage: GameStage.loading,
          error: null,
          games: List.empty(growable: true),
          selectedGameIds: List.empty(growable: true),
          currentStep: 0,
        )) {
    on<GameEvent>(_handler);
  }

  EventHandler<GameEvent, GameState> get _handler => (event, emit) {
        return switch (event) {
          GameEventInit() => _onInitEvent(emit),
          GameEventLikeItem(gameId: int gameId) => _onLikeItem(emit, gameId),
          GameEventNextStep() => _onNextStep(emit),
          GameEventReportResponse() => _onReportResponse(emit),
        };
      };

  void _onInitEvent(Emitter<GameState> emit) async {
    emit(state.copyWith(stage: GameStage.loading));
    try {
      final response = await _gameRepository.getGames();
      print('response: $response');
      if (response.error != null) {
        throw response.error!;
      }

      final games = response.data ?? [];
      final gameModels = games.map((e) => Game.fromResponse(e)).toList();

      emit(state.copyWith(
        stage: GameStage.loaded,
        games: gameModels,
      ));
    } catch (e, stackTrace) {
      print('Error loading games: $e\n$stackTrace');
      final errorMessage = e.toString();
      emit(state.copyWith(
        stage: GameStage.error,
        error: errorMessage,
        games: [], // Ensure games is never null
      ));
    }
  }

  void _onLikeItem(Emitter<GameState> emit, int gameId) {
    final gameIndex = state.games.indexWhere((e) => e.id == gameId);
    if (gameIndex >= 0) {
      final pairStartIndex =
          (gameIndex ~/ 2) * 2; // Get start index of the pair
      final games = [...state.games];

      // Toggle clicked game
      games[gameIndex] =
          games[gameIndex].copyWith(isLiked: !games[gameIndex].isLiked);

      // If game was liked and other game in pair is liked, unlike the other game
      if (games[gameIndex].isLiked) {
        final otherGameIndex =
            gameIndex % 2 == 0 ? pairStartIndex + 1 : pairStartIndex;
        if (otherGameIndex < games.length && games[otherGameIndex].isLiked) {
          games[otherGameIndex] =
              games[otherGameIndex].copyWith(isLiked: false);
        }
      }

      emit(state.copyWith(games: games));
    }
  }

  void _onNextStep(Emitter<GameState> emit) {
    if (state.currentStep + 1 <= 10) {
      final likedGames = state.games
          .where((game) =>
              game.isLiked && !state.selectedGameIds.contains(game.id))
          .map((game) => game.id)
          .toList();
      print('likedGames: $likedGames');
      emit(state.copyWith(
        currentStep: state.currentStep + 1,
        selectedGameIds: [...state.selectedGameIds, ...likedGames],
      ));
    } else {
      add(GameEventReportResponse());
    }
  }

  void _onReportResponse(Emitter<GameState> emit) {
    emit(state.copyWith(stage: GameStage.loading));
  }

  @override
  Future<void> close() async {
    await _gameCacheService.dispose();
    return super.close();
  }
}
