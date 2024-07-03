import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';

class FeatureRow extends StatelessWidget {
  const FeatureRow({
    super.key,
    required this.icon,
    required this.description,
  });

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final featuresWidth = width <= Sizes.mobileWidth
        ? width * 0.7
        : (width > Sizes.mobileWidth && width <= Sizes.tabletWidth)
            ? width * 0.8
            : width * 0.5;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spaces.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Sizes.featureRowWidth,
            height: Sizes.featureRowHeight,
            alignment: Alignment.center,
            child: FaIcon(icon, size: Sizes.featureRowIconSize),
          ),
          const Gap(Spaces.xLarge),
          SizedBox(
            width: featuresWidth,
            child: Text(
              description,
              style: const TextStyle(fontSize: Sizes.featureRowTextFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
