import 'package:dayme_assignment/presentation/promo_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'app_routes.dart';

@singleton
class AppRouter {
  final GlobalKey<NavigatorState> rootNavigationKey;
  final GoRouter router;

  AppRouter._(this.router, this.rootNavigationKey);

  BuildContext? get context => rootNavigationKey.currentState?.context;

  factory AppRouter() {
    final rootNavigationKey = GlobalKey<NavigatorState>();

    final router = GoRouter(
      navigatorKey: rootNavigationKey,
      initialLocation: AppRoutes.promo.path,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: AppRoutes.promo.name,
          path: AppRoutes.promo.path,
          parentNavigatorKey: rootNavigationKey,
          builder: (context, state) {
            return const PromoScreen();
          },
        ),
      ],
    );

    return AppRouter._(router, rootNavigationKey);
  }
}
