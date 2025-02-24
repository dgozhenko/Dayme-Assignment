import 'package:dayme_assignment/core/di/configuration.dart';
import 'package:dayme_assignment/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<GoRouter> launch() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment =
      String.fromEnvironment('environment', defaultValue: 'dev');
  final getIt = await configureDependencies(environment);
  final navigation = getIt<AppRouter>();

  return navigation.router;
}
