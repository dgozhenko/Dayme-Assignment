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
    @HiveField(2) required int productId,
  }) = _GameResponse;

  factory GameResponse.fromJson(Map<String, dynamic> json) =>
      _$GameResponseFromJson(json);

  static List<GameResponse> fromJsonList(List<dynamic> jsonList) {
    // Flatten the nested list structure and convert each item
    return jsonList.expand((group) {
      // Each group is a List<Map<String, dynamic>>
      final List<dynamic> groupItems = group as List<dynamic>;
      return groupItems.map((item) => GameResponse(
            name: item['name'] as String,
            photoUrl: item['photoUrl'] as String,
            productId: item[
                'productId'], // Convert to String since our model expects String
          ));
    }).toList();
  }
}
