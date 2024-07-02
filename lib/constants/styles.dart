import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';

import 'const_colors.dart';

class ConstStyles {
  static InputDecoration decoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: ConstColors.inputDecorationFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Sizes.inputDecorationBorderRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Sizes.inputDecorationBorderRadius,
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Sizes.inputDecorationBorderRadius,
        ),
        borderSide: const BorderSide(
          color: ConstColors.inputDecorationFocusBorderColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Sizes.inputDecorationBorderRadius,
        ),
        borderSide: const BorderSide(
          color: ConstColors.inputDecorationErrorBorderColor,
        ),
      ),
    );
  }
}
