import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';

class SupportUsButton extends StatelessWidget {
  const SupportUsButton({
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
        foregroundColor: ConstColors.supportUsButtonForegroundColor,
        backgroundColor: ConstColors.supportUsButtonBackgroundColor,
        textStyle: const TextStyle(
          fontSize: Sizes.supportUsButtonFontSize,
          fontWeight: FontWeight.bold,
        ),
        disabledForegroundColor:
            ConstColors.supportUsButtonDisabledForegroundColor,
        disabledBackgroundColor:
            ConstColors.supportUsButtonDisabledBackgroundColor,
        minimumSize: const Size(
          Sizes.supportUsButtonMinimumWidth,
          Sizes.supportUsButtonMinimumHeight,
        ),
        maximumSize: const Size(
          Sizes.supportUsButtonMaximumWidth,
          Sizes.supportUsButtonMaximumHeight,
        ),
        shadowColor: ConstColors.supportUsButtonShadowColor,
        elevation: Sizes.supportUsButtonElevation,
        side: BorderSide(
          color: ConstColors.supportUsButtonBorderColor,
          width: Sizes.supportUsButtonBorderWidth,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Sizes.supportUsButtonBorderRadius,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.bitcoin,
            color: ConstColors.supportUsIconColor,
            size: Sizes.supportUsIconSize,
          ),
          const Gap(Spaces.medium),
          Text(title),
        ],
      ),
    );
  }
}
