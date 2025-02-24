import 'package:dayme_assignment/data/repository/game_repository_impl.dart';
import 'package:dayme_assignment/domain/api/game_api_client.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  GameRepository gameRepository(GameApiClient gameApiClient) =>
      GameRepositoryImpl(gameApiClient);
}
