part of 'game_bloc.dart';

@freezed
sealed class GameEvent with _$GameEvent {
  const factory GameEvent.init() = GameEventInit;
  const factory GameEvent.likeItem({required int gameId}) = GameEventLikeItem;
  const factory GameEvent.nextStep() = GameEventNextStep;
  const factory GameEvent.reportResponse() = GameEventReportResponse;
  const factory GameEvent.errorObserved() = GameEventErrorObserved;
}
