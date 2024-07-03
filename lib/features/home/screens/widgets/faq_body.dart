import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/home/data/models/faq_item.dart';

class FAQBody extends StatelessWidget {
  const FAQBody({
    super.key,
    required this.item,
  });

  final FAQItem item;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: Values.faqAnimationDuration),
      curve: Curves.easeInOut,
      height: item.isExpanded ? null : 0,
      child: Padding(
        padding: const EdgeInsets.all(Spaces.large),
        child: Text(
          item.answer,
          style: const TextStyle(
            fontSize: Sizes.faqAnswerFontSize,
          ),
        ),
      ),
    );
  }
}
