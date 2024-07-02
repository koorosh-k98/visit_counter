import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/create_url/controllers/create_url_controller.dart';
import 'package:visit_counter/features/create_url/data/extensions/url_extension.dart';

class URLWidget extends ConsumerWidget {
  const URLWidget({super.key, required this.url});

  final URL? url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    if (url == null) {
      return const SizedBox(height: Sizes.urlPlaceHolderHeight);
    }
    return Column(
      children: [
        Container(
          width: width * 0.8,
          padding: const EdgeInsets.all(Spaces.small),
          child: const Text(
            Strings.markDown,
            style: TextStyle(
              fontSize: Sizes.markDownFontSize,
            ),
          ),
        ),
        Container(
          width: width * 0.8,
          padding: const EdgeInsets.all(Spaces.xSmall),
          decoration: BoxDecoration(
            color: ConstColors.urlContainerSuccessColor,
            border: Border.all(width: Sizes.urlContainerBorderWidth),
            borderRadius: BorderRadius.circular(Sizes.urlContainerBorderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.65,
                  padding: const EdgeInsets.all(Spaces.small),
                  child: SelectableText(
                    url!.toMarkDown(),
                    style: const TextStyle(fontSize: Sizes.urlFontSize),
                    textAlign: TextAlign.start,
                  ),
                ),
                IconButton(
                  onPressed: () => ref
                      .read(createUrlControllerProvider)
                      .onCopyButtonPressed(url!.toMarkDown()),
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ),
        const Gap(Spaces.xxLarge),
        Container(
          width: width * 0.8,
          padding: const EdgeInsets.all(Spaces.small),
          child: const Text(
            Strings.html,
            style: TextStyle(
              fontSize: Sizes.htmlFontSize,
            ),
          ),
        ),
        Container(
          width: width * 0.8,
          padding: const EdgeInsets.all(Spaces.xSmall),
          decoration: BoxDecoration(
            color: ConstColors.urlContainerSuccessColor,
            border: Border.all(width: Sizes.urlContainerBorderWidth),
            borderRadius: BorderRadius.circular(Sizes.urlContainerBorderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.65,
                  padding: const EdgeInsets.all(Spaces.small),
                  child: SelectableText(
                    url!.toHTML(),
                    style: const TextStyle(fontSize: Sizes.urlFontSize),
                    textAlign: TextAlign.start,
                  ),
                ),
                IconButton(
                  onPressed: () => ref
                      .read(createUrlControllerProvider)
                      .onCopyButtonPressed(url!.toHTML()),
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
