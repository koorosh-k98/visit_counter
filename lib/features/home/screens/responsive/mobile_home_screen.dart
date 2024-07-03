import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/core/providers/scroll.dart';
import 'package:visit_counter/features/home/screens/widgets/contact_us_section.dart';
import 'package:visit_counter/features/home/screens/widgets/faq.dart';
import 'package:visit_counter/features/home/screens/widgets/first_features_column.dart';
import 'package:visit_counter/features/home/screens/widgets/footer.dart';
import 'package:visit_counter/features/home/screens/widgets/second_features_column.dart';
import 'package:visit_counter/features/home/screens/widgets/support_us.dart';
import 'package:visit_counter/features/home/screens/widgets/svg_image.dart';
import 'package:visit_counter/features/home/screens/widgets/third_features_column.dart';
import 'package:visit_counter/services/navigation_service/app_route.dart';
import 'package:visit_counter/services/navigation_service/navigation_service.dart';
import 'package:visit_counter/widgets/custom_button.dart';
import 'package:visit_counter/widgets/logo.dart';
import 'package:visit_counter/widgets/page_title.dart';

class MobileHomeScreen extends ConsumerStatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  ConsumerState<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends ConsumerState<MobileHomeScreen> {
  final ScrollController scrollController = ScrollController();
  bool shouldShowFloatingActionButton = false;

  _scrollListener() {
    var shouldShow = scrollController.position.pixels > Values.scrollOffset;
    if (shouldShow != shouldShowFloatingActionButton) {
      setState(() {
        shouldShowFloatingActionButton = shouldShow;
      });
    }
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(Spaces.medium),
          child: Column(
            children: [
              const Logo(),
              const Gap(Spaces.xxLarge),
              const SupportUs(),
              const PageTitle(title: Strings.countEveryVisitYourPageHas),
              const SvgImage(svg: Values.happySVG),
              const FirstFeaturesColumn(),
              const Gap(Spaces.xxxLarge),
              const SvgImage(svg: Values.customizationSVG),
              const SecondFeaturesColumn(),
              const Gap(Spaces.xxxLarge),
              const SvgImage(svg: Values.browsersSVG),
              const Gap(Spaces.xxLarge),
              const ThirdFeaturesColumn(),
              const Gap(Spaces.xxxLarge),
              CustomButton(
                title: Strings.tryItNow,
                onPressed: () =>
                    ref.read(navigationServiceProvider).go(AppRoute.createUrl),
              ),
              const Gap(Spaces.superLarge),
              const FAQ(),
              const Gap(Spaces.superLarge),
              const ContactUsSection(),
              const Gap(Spaces.xxxLarge),
              const Footer(),
              const Gap(Spaces.xLarge),
            ],
          ),
        ),
      ),
      floatingActionButton: shouldShowFloatingActionButton
          ? FloatingActionButton.small(
              onPressed: () =>
                  ref.read(scrollProvider).scrollToTop(scrollController),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
