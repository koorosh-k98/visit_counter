import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_counter/services/navigation_service/route_provider.dart';

import 'app_route.dart';

final navigationServiceProvider = Provider<NavigationService>(
  (ref) => NavigationService(
    goRouter: ref.watch(routeProvider),
  ),
);

class NavigationService {
  final GoRouter goRouter;

  NavigationService({
    required this.goRouter,
  });

  void go(AppRoute page,
      {Map<String, String> params = const {},
      Map<String, String> queryParams = const {},
      dynamic extra}) {
    goRouter.goNamed(page.name,
        pathParameters: params, queryParameters: queryParams, extra: extra);
  }

  void forward(AppRoute page,
      {Map<String, String> params = const {},
      Map<String, String> queryParams = const {},
      dynamic extra}) {
    goRouter.pushNamed(page.name,
        pathParameters: params, queryParameters: queryParams, extra: extra);
  }

  void back() {
    if (!goRouter.canPop()) {
      return;
    }
    goRouter.pop();
  }
}
