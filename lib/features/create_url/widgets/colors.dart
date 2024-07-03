import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/create_url/data/providers/colors_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/icons_provider.dart';
import 'package:visit_counter/features/create_url/widgets/preview.dart';

class ColorsWidget extends ConsumerWidget {
  const ColorsWidget({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsProvider);
    final backgroundColors = ref.watch(backgroundColorsProvider);
    final colorsIndex = ref.watch(colorsIndexProvider);
    final colorsIndexNotifier = ref.watch(colorsIndexProvider.notifier);
    final icon = ref.watch(iconProvider);

    return Column(
      children: [
        const Gap(Spaces.xxxLarge),
        const Text(
          Strings.chooseColor,
          style: TextStyle(fontSize: Sizes.chooseColorFontSize),
        ),
        const Gap(Spaces.medium),
        for (final (index, color) in backgroundColors.indexed)
          FittedBox(
            child: GestureDetector(
              onTap: () => colorsIndexNotifier.setIndex(index),
              child: Padding(
                padding: const EdgeInsets.all(Spaces.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: index,
                      groupValue: colorsIndex,
                      onChanged: (value) =>
                          colorsIndexNotifier.setIndex(value ?? 0),
                    ),
                    Preview(
                      label: labelText,
                      icon: icon,
                      color: colors[index],
                      backgroundColor: color,
                      count: Values.counter,
                    )
                  ],
                ),
              ),
            ),
          ),
        GestureDetector(
          onTap: () => colorsIndexNotifier.setIndex(colors.length),
          child: Padding(
            padding: const EdgeInsets.all(Spaces.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: colors.length,
                  groupValue: colorsIndex,
                  onChanged: (value) =>
                      colorsIndexNotifier.setIndex(colors.length),
                ),
                const Text(Strings.randomColors),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
