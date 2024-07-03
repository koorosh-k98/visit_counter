import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_counter/features/create_url/screens/create_url_screen.dart';
import 'package:visit_counter/features/home/screens/home_screen.dart';

final routeProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: false,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      GoRoute(
        path: '/create_url',
        name: '/create_url',
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
