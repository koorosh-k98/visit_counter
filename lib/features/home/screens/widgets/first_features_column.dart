import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/services/navigation_service/app_route.dart';
import 'package:visit_counter/services/navigation_service/navigation_service.dart';
import 'package:visit_counter/widgets/custom_button.dart';

import 'feature_row.dart';

class FirstFeaturesColumn extends ConsumerWidget {
  const FirstFeaturesColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const FeatureRow(
          icon: FontAwesomeIcons.faceSmileWink,
          description: Strings.totallyPersonalizable,
        ),
        const FeatureRow(
          icon: FontAwesomeIcons.fire,
          description: Strings.useItOnAnyPageYouLike,
        ),
        const FeatureRow(
          icon: FontAwesomeIcons.code,
          description: Strings.noCodeKnowledgeIsRequired,
        ),
        const FeatureRow(
          icon: FontAwesomeIcons.dollarSign,
          description: Strings.freeForEver,
        ),
        const Gap(Spaces.xxxLarge),
        CustomButton(
          title: Strings.generateYourVisitCounter,
          onPressed: () =>
              ref.read(navigationServiceProvider).go(AppRoute.createUrl),
        ),
      ],
    );
  }
}
