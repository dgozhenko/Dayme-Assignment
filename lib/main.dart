import 'package:dayme_assignment/core/setup/launch.dart';
import 'package:dayme_assignment/data/local/game_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final gameCacheService = GameCacheService();
  await gameCacheService.init();

  final router = await launch();
  runApp(
    MaterialApp.router(
      title: 'DaymeAssignment',
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      backButtonDispatcher: router.backButtonDispatcher,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    ),
  );
}
