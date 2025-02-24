// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/local/game_cache_service.dart' as _i894;
import '../../domain/api/game_api_client.dart' as _i730;
import '../../domain/repository/game_repository.dart' as _i622;
import '../../presentation/game/bloc/game_bloc.dart' as _i610;
import '../navigation/app_router.dart' as _i630;
import 'modules/bloc_module.dart' as _i539;
import 'modules/network_module.dart' as _i851;
import 'modules/repository_module.dart' as _i554;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $configureDependencies(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final repositoryModule = _$RepositoryModule();
  final blocModule = _$BlocModule();
  gh.singleton<_i361.Dio>(() => networkModule.provideDio());
  gh.singleton<_i630.AppRouter>(() => _i630.AppRouter());
  gh.lazySingleton<_i894.GameCacheService>(() => _i894.GameCacheService());
  gh.singleton<_i730.GameApiClient>(
      () => networkModule.provideGameApiClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i622.GameRepository>(() => repositoryModule.gameRepository(
        gh<_i730.GameApiClient>(),
        gh<_i894.GameCacheService>(),
      ));
  gh.factory<_i610.GameBloc>(() => blocModule.gameBloc(
        gh<_i622.GameRepository>(),
        gh<_i894.GameCacheService>(),
      ));
  return getIt;
}

class _$NetworkModule extends _i851.NetworkModule {}

class _$RepositoryModule extends _i554.RepositoryModule {}

class _$BlocModule extends _i539.BlocModule {}
