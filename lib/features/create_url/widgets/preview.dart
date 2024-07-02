import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/features/create_url/widgets/icon_preview.dart';

class Preview extends ConsumerWidget {
  const Preview({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.count,
  });

  final String label;
  final String icon;
  final Color color;
  final Color backgroundColor;
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textSpan = TextSpan(
      text: label,
      style: const TextStyle(fontSize: Sizes.previewFontSize),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: Sizes.previewLabelTextMinWidth,
      maxWidth: Sizes.previewLabelTextMaxWidth,
    );

    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(Spaces.small),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: textPainter.width + Sizes.previewCounterWidth,
              height: Sizes.previewHeight,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(Sizes.previewBorderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: textPainter.width + Sizes.previewLabelTextWidth,
                    height: Sizes.previewHeight,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Sizes.previewBorderRadius),
                        bottomLeft: Radius.circular(Sizes.previewBorderRadius),
                      ),
                    ),
                    padding: const EdgeInsets.all(Spaces.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Spaces.xSmall),
                          child: IconPreview(
                            icon: icon,
                            color: backgroundColor,
                            iconColor: color,
                            fromPreview: true,
                          ),
                        ),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: Sizes.previewFontSize,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(Spaces.small),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: Sizes.previewFontSize,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
