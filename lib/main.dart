import 'package:dayme_assignment/core/setup/launch.dart';
import 'package:flutter/material.dart';

void main() async {
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
