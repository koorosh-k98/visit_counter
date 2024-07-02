import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';

class IconPreview extends StatelessWidget {
  const IconPreview({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.fromPreview,
  });

  final String icon;
  final Color color;
  final Color iconColor;
  final bool fromPreview;

  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'fill="#\w+"');
    String replacedIcon = icon.replaceAll(
      regex,
      'stroke="#${Colors.white.value.toRadixString(16)}"',
    );

    return Container(
      width: Sizes.iconPreviewWidth,
      height: Sizes.iconPreviewHeight,
      padding:
          fromPreview ? EdgeInsets.zero : const EdgeInsets.all(Spaces.medium),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Sizes.iconPreviewBorderRadius),
      ),
      child: SvgPicture.string('''
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          $replacedIcon
        </svg>
      '''),
    );
  }
}
