import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_response.freezed.dart';
part 'game_response.g.dart';

@freezed
class GameResponse with _$GameResponse {
  factory GameResponse({
    required String name,
    required String photoUrl,
    required String productId,
  }) = _GameResponse;

  factory GameResponse.fromJson(Map<String, dynamic> json) =>
      _$GameResponseFromJson(json);
}
