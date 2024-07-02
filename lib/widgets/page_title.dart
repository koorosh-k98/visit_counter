import 'package:flutter/material.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(Spaces.xxLarge),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: Sizes.titleFontSize,
            fontWeight: FontWeight.bold,
            color: ConstColors.titleColor,
          ),
        ),
      ),
    );
  }
}
