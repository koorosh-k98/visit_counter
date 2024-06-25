import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:visit_counter/services/snack_bar_service/scaffold_messenger_key_provider.dart';

import 'constants/strings.dart';
import 'features/create_url/screens/create_url_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

// The route configuration.
final GoRouter _router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: "/create_url",
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/create_url',
      name: '/create_url',
      builder: (BuildContext context, GoRouterState state) {
        return const CreateUrlScreen();
      },
    ),
  ],
  errorBuilder: (context, state) => const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text("404"),
      ),
    ),
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      title: Strings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
