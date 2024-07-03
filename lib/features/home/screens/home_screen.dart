import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/features/home/screens/responsive/laptop_home_screen.dart';
import 'package:visit_counter/features/home/screens/responsive/mobile_home_screen.dart';
import 'package:visit_counter/features/home/screens/responsive/tablet_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: constraints.minWidth <= Sizes.mobileWidth
            ? const MobileHomeScreen()
            : (constraints.minWidth > Sizes.mobileWidth &&
                    constraints.minWidth <= Sizes.tabletWidth)
                ? const TabletHomeScreen()
                : const LaptopHomeScreen(),
      ),
    );
  }
}
