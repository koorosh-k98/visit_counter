import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Sizes.circularProgressIndicatorWidth,
      height: Sizes.circularProgressIndicatorHeight,
      child: CircularProgressIndicator(),
    );
  }
}
