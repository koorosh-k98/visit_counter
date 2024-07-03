import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/home/data/models/faq_item.dart';

class FaqHeader extends StatelessWidget {
  const FaqHeader({
    super.key,
    required this.item,
  });

  final FAQItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(
        Spaces.medium,
        Spaces.medium,
        0,
        Spaces.medium,
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Q${item.number}.  ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.faqQuestionFontSizeBold,
              ),
            ),
            TextSpan(
              text: item.question,
              style: const TextStyle(fontSize: Sizes.faqQuestionFontSize),
            ),
          ],
        ),
      ),
      trailing: AnimatedRotation(
        turns: item.isExpanded ? 0.5 : 0,
        duration: const Duration(milliseconds: Values.faqAnimationDuration),
      ),
    );
  }
}
