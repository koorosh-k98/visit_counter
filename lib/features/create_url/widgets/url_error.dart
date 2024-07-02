import 'package:flutter/material.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';

class URLErrorWidget extends StatelessWidget {
  const URLErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      padding: const EdgeInsets.all(Spaces.small),
      decoration: BoxDecoration(
        color: ConstColors.urlContainerFailedColor,
        border: Border.all(width: Sizes.urlContainerBorderWidth),
        borderRadius: BorderRadius.circular(Sizes.urlContainerBorderRadius),
      ),
      child: Center(
        child: Text(
          error,
          style: const TextStyle(
            fontSize: Sizes.urlFontSize,
            color: ConstColors.urlContainerFailedTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
