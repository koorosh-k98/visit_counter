import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/services/navigation_service/route_provider.dart';
import 'package:visit_counter/services/snack_bar_service/scaffold_messenger_key_provider.dart';

import 'constants/strings.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      title: Strings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: ConstColors.scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ConstColors.scaffoldSeedColor,
        ),
        useMaterial3: true,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
