import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/home/screens/widgets/feature_row.dart';

class SecondFeaturesColumn extends StatelessWidget {
  const SecondFeaturesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureRow(
          icon: FontAwesomeIcons.paintbrush,
          description: Strings.wideVarietyOfColors,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.icons,
          description: Strings.differentIcons,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.truckFast,
          description: Strings.loadsFast,
        ),
        FeatureRow(
          icon: FontAwesomeIcons.feather,
          description: Strings.lightWeightLikeAFeather,
        ),
        Gap(Spaces.xxxLarge),
      ],
    );
  }
}
