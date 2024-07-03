import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/features/create_url/screens/responsive/laptop_create_url_screen.dart';
import 'package:visit_counter/features/create_url/screens/responsive/mobile_create_url_screen.dart';
import 'package:visit_counter/features/create_url/screens/responsive/tablet_create_url_screen.dart';

class CreateUrlScreen extends StatelessWidget {
  const CreateUrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: constraints.minWidth <= Sizes.mobileWidth
            ? const MobileCreateUrlScreen()
            : (constraints.minWidth > Sizes.mobileWidth &&
                    constraints.minWidth <= Sizes.tabletWidth)
                ? const TabletCreateUrlScreen()
                : const LaptopCreateUrlScreen(),
      ),
    );
  }
}
