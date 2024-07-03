import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_counter/features/create_url/screens/create_url_screen.dart';
import 'package:visit_counter/features/home/screens/home_screen.dart';
import 'package:visit_counter/services/navigation_service/app_route.dart';

final routeProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: false,
    initialLocation: AppRoute.home.name,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: AppRoute.createUrl.path,
        name: AppRoute.createUrl.name,
        builder: (BuildContext context, GoRouterState state) =>
            const CreateUrlScreen(),
      ),
    ],
    errorBuilder: (context, state) => const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("404"),
        ),
      ),
    ),
  ),
);
