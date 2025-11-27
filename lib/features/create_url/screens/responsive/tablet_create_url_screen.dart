import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/constants/styles.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/core/providers/scroll.dart';
import 'package:visit_counter/features/create_url/controllers/create_url_controller.dart';
import 'package:visit_counter/features/create_url/data/providers/colors_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/create_url_data_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/form_key_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/icons_provider.dart';
import 'package:visit_counter/features/create_url/widgets/colors.dart';
import 'package:visit_counter/features/create_url/widgets/icons.dart';
import 'package:visit_counter/features/create_url/widgets/loading.dart';
import 'package:visit_counter/features/create_url/widgets/preview.dart';
import 'package:visit_counter/features/create_url/widgets/url.dart';
import 'package:visit_counter/features/create_url/widgets/url_error.dart';
import 'package:visit_counter/features/home/screens/widgets/support_us.dart';
import 'package:visit_counter/widgets/custom_button.dart';
import 'package:visit_counter/widgets/logo.dart';
import 'package:visit_counter/widgets/page_title.dart';

class TabletCreateUrlScreen extends ConsumerStatefulWidget {
  const TabletCreateUrlScreen({super.key});

  @override
  ConsumerState<TabletCreateUrlScreen> createState() =>
      _TabletCreateUrlScreenState();
}

class _TabletCreateUrlScreenState extends ConsumerState<TabletCreateUrlScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController labelController = TextEditingController(
    text: Strings.labelHint,
  );

  final ScrollController scrollController = ScrollController();
  bool shouldShowFloatingActionButton = false;

  void _scrollListener() {
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
    usernameController.dispose();
    labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(formKeyProvider);

    final color = ref.watch(colorProvider);
    final backgroundColor = ref.watch(backgroundColorProvider);
    final colorsIndex = ref.watch(colorsIndexProvider);
    final icon = ref.watch(iconProvider);
    final iconsIndex = ref.watch(iconsIndexProvider);

    final asyncUrl = ref.watch(createUrlDataProvider);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double padding = width <= Sizes.mobileWidth ? 0 : Spaces.xxLarge;

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(Spaces.medium),
                  height: height - Sizes.previewContainerHeight,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Logo(),
                            SupportUs(),
                          ],
                        ),
                        const PageTitle(title: Strings.createYourCustomCounter),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: width * 0.9,
                            padding: EdgeInsets.symmetric(
                              horizontal: padding,
                              vertical: Spaces.small,
                            ),
                            child: const Text(
                              Strings.username,
                              style: TextStyle(
                                fontSize: Sizes.usernameFontSize,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: width * 0.9,
                            padding: EdgeInsets.only(left: padding),
                            child: TextFormField(
                              controller: usernameController,
                              decoration: ConstStyles.decoration(
                                Strings.usernameHint,
                              ),
                              maxLength: Values.usernameMaxLength,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  validator(value, Strings.username),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: width * 0.9,
                            padding: EdgeInsets.symmetric(
                              horizontal: padding,
                              vertical: Spaces.small,
                            ),
                            child: const Text(
                              Strings.label,
                              style: TextStyle(
                                fontSize: Sizes.labelFontSize,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: width * 0.9,
                            padding: EdgeInsets.only(left: padding),
                            child: TextFormField(
                              controller: labelController,
                              decoration: ConstStyles.decoration(
                                Strings.labelHint,
                              ),
                              maxLength: Values.labelMaxLength,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  validator(value, Strings.label),
                              onChanged: (value) =>
                                  ref.invalidate(createUrlDataProvider),
                            ),
                          ),
                        ),
                        const Gap(Spaces.xxLarge),
                        const IconsWidget(),
                        const Gap(Spaces.xLarge),
                        SizedBox(
                          width: width * 0.4,
                          height: width * 0.6,
                          child: SvgPicture.asset(Values.loveSVG),
                        ),
                        const Gap(Spaces.xxLarge),
                        ColorsWidget(labelText: labelController.text),
                        const Gap(Spaces.xLarge),
                        CustomButton(
                          title: Strings.generate,
                          onPressed: asyncUrl.isLoading
                              ? null
                              : () => ref
                                  .read(createUrlControllerProvider)
                                  .generate(
                                    usernameController.text,
                                    labelController.text,
                                    iconsIndex,
                                    colorsIndex,
                                    scrollController,
                                  ),
                        ),
                        const Gap(Spaces.xLarge),
                        asyncUrl.when(
                          data: (url) => URLWidget(url: url),
                          error: (error, _) => URLErrorWidget(
                            error: error.toString(),
                          ),
                          loading: () => const Loading(),
                        ),
                        const Gap(Spaces.large),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: Sizes.previewBottomPosition,
                child: Container(
                  width: width,
                  height: Sizes.previewContainerHeight,
                  color: ConstColors.previewContainerBackgroundColor,
                  child: Preview(
                    label: labelController.text,
                    icon: icon,
                    color: color,
                    backgroundColor: backgroundColor,
                    count: Values.counter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: shouldShowFloatingActionButton
          ? FloatingActionButton(
              onPressed: () =>
                  ref.read(scrollProvider).scrollToTop(scrollController),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }

  String? validator(String? value, String name) {
    if (value == '') return '${Strings.enter} $name';
    return null;
  }
}
