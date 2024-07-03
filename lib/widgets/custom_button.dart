import 'package:flutter/material.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: ConstColors.customButtonForegroundColor,
        backgroundColor: ConstColors.customButtonBackgroundColor,
        textStyle: const TextStyle(
          fontSize: Sizes.customButtonFontSize,
          fontWeight: FontWeight.bold,
        ),
        disabledForegroundColor:
            ConstColors.customButtonDisabledForegroundColor,
        disabledBackgroundColor:
            ConstColors.customButtonDisabledBackgroundColor,
        minimumSize: const Size(
          Sizes.customButtonMinimumWidth,
          Sizes.customButtonMinimumHeight,
        ),
        shadowColor: ConstColors.customButtonShadowColor,
        elevation: Sizes.customButtonElevation,
        side: BorderSide(
          color: ConstColors.customButtonBorderColor,
          width: Sizes.customButtonBorderWidth,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.customButtonBorderRadius),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
      child: Text(title),
    );
  }
}
