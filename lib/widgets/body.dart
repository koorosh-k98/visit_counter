import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: Sizes.bodyMaxLines,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Sizes.bodyFontSize,
        height: Sizes.bodyLineHeight,
      ),
    );
  }
}
