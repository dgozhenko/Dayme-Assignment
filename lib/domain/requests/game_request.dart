import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_request.freezed.dart';
part 'game_request.g.dart';

@freezed
class GameRequest with _$GameRequest {
  const factory GameRequest({
    required int bonus,
    required List<int> likeIds,
  }) = _GameRequest;

  factory GameRequest.fromJson(Map<String, dynamic> json) =>
      _$GameRequestFromJson(json);
}
