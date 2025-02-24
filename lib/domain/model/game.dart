import 'package:dayme_assignment/domain/responses/game_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required int id,
    required String name,
    required String imageUrl,
    required bool isLiked,
  }) = _Game;

  factory Game.fromResponse(GameResponse response) => Game(
        id: response.productId,
        name: response.name,
        imageUrl: response.photoUrl,
        isLiked: false,
      );
}
