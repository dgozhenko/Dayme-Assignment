part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required GameStage stage,
    required String? error,
    required List<Game> games,
    required List<int> selectedGameIds,
    required int currentStep,
  }) = _GameState;
}

enum GameStage { initial, loading, error, loaded, reportSent }

extension GameStageX on GameStage {
  bool get isLoading => this == GameStage.loading;
  bool get isError => this == GameStage.error;
  bool get isLoaded => this == GameStage.loaded;
}
