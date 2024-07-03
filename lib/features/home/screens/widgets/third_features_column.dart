import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/home/screens/widgets/feature_row.dart';

class ThirdFeaturesColumn extends StatelessWidget {
  const ThirdFeaturesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureRow(
          icon: FontAwesomeIcons.faceLaughBeam,
          description: Strings.easyToUse,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.image,
          description: Strings.useItAsAnImageAnywhere,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.fileCode,
          description: Strings.getGeneratedMarkDown,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.html5,
          description: Strings.getGeneratedHtmlCode,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.chrome,
          description: Strings.supportsAllModernBrowsers,
        ),
        Gap(Spaces.xxxLarge),
      ],
    );
  }
}
