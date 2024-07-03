import 'package:collection/collection.dart';

enum AppRoute {
  /// home
  home(
    name: '/',
    path: '/',
  ),

  /// create url
  createUrl(
    name: '/create_url',
    path: '/create_url',
  );

  final String name;
  final String path;

  const AppRoute({
    required this.name,
    required this.path,
  });
}

AppRoute? appRouteFromString(String string) =>
    AppRoute.values.firstWhereOrNull((appRoute) => appRoute.name == string);
