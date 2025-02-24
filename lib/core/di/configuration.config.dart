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

import '../../domain/api/game_api_client.dart' as _i730;
import '../../domain/repository/game_repository.dart' as _i622;
import '../navigation/app_router.dart' as _i630;
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
  gh.singleton<_i630.AppRouter>(() => _i630.AppRouter());
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'base_url',
  );
  gh.singleton<_i361.Dio>(
      () => networkModule.dio(gh<String>(instanceName: 'base_url')));
  gh.singleton<_i730.GameApiClient>(() => networkModule.gameClient(
        gh<_i361.Dio>(),
        gh<String>(instanceName: 'base_url'),
      ));
  gh.lazySingleton<_i622.GameRepository>(
      () => repositoryModule.gameRepository(gh<_i730.GameApiClient>()));
  return getIt;
}

class _$NetworkModule extends _i851.NetworkModule {}

class _$RepositoryModule extends _i554.RepositoryModule {}
