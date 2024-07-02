import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_counter/constants/sizes.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({super.key, required this.svg});

  final String svg;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final svgImageWidth =
        width > Sizes.tabletWidth ? width * 0.35 : width * 0.6;

    return SizedBox(
      width: svgImageWidth,
      height: svgImageWidth,
      child: SvgPicture.asset(svg),
    );
  }
}
