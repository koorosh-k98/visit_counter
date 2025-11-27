import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/create_url/data/providers/colors_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/icons_provider.dart';
import 'package:visit_counter/features/create_url/widgets/icon_preview.dart';

class IconsWidget extends ConsumerWidget {
  const IconsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColors = ref.watch(backgroundColorsProvider);
    final icons = ref.watch(iconsProvider);
    final iconsIndex = ref.watch(iconsIndexProvider);
    final iconsIndexNotifier = ref.watch(iconsIndexProvider.notifier);

    return Column(
      children: <Widget>[
        const Gap(Spaces.xxxLarge),
        const Text(
          Strings.chooseIcon,
          style: TextStyle(fontSize: Sizes.chooseIconFontSize),
        ),
        const Gap(Spaces.medium),
        for (final (index, icon) in icons.indexed)
          GestureDetector(
            onTap: () => iconsIndexNotifier.setIndex(index),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: index,
                  groupValue: iconsIndex,
                  onChanged: (value) => iconsIndexNotifier.setIndex(value ?? 0),
                ),
                const Gap(Spaces.medium),
                for (final color in backgroundColors)
                  Container(
                    margin: const EdgeInsets.all(Spaces.small),
                    child: Center(
                      child: IconPreview(
                        icon: icon,
                        color: color,
                        iconColor: ConstColors.iconsColor,
                        fromPreview: false,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () => iconsIndexNotifier.setIndex(icons.length),
          child: Padding(
            padding: const EdgeInsets.all(Spaces.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: icons.length,
                  groupValue: iconsIndex,
                  onChanged: null,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context).colorScheme.primary;
                    }
                    return ConstColors.radioUnselectedColor;
                  }),
                ),
                const Text(Strings.randomIcons),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
