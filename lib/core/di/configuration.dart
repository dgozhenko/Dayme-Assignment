import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'configuration.config.dart';
import 'locator.dart';

@InjectableInit(
    initializerName: r'$configureDependencies',
    preferRelativeImports: true,
    asExtension: false)
Future<GetIt> configureDependencies(String environment) async =>
    $configureDependencies(locator, environment: environment);
