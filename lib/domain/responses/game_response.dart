import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'game_response.freezed.dart';
part 'game_response.g.dart';

@freezed
@HiveType(typeId: 0)
class GameResponse with _$GameResponse {
  factory GameResponse({
    @HiveField(0) required String name,
    @HiveField(1) required String photoUrl,
    @HiveField(2) required String productId,
  }) = _GameResponse;

  factory GameResponse.fromJson(Map<String, dynamic> json) =>
      _$GameResponseFromJson(json);
}
