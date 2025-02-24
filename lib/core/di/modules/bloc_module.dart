import 'package:dayme_assignment/data/local/game_cache_service.dart';
import 'package:dayme_assignment/domain/repository/game_repository.dart';
import 'package:dayme_assignment/presentation/game/bloc/game_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BlocModule {
  @injectable
  GameBloc gameBloc(
          GameRepository gameRepository, GameCacheService gameCacheService) =>
      GameBloc(gameRepository, gameCacheService);
}
