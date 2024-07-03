import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/home/data/models/faq_item.dart';
import 'package:visit_counter/features/home/data/providers/faq_provider.dart';
import 'package:visit_counter/features/home/screens/widgets/faq_body.dart';
import 'package:visit_counter/features/home/screens/widgets/faq_header.dart';

class FAQ extends ConsumerStatefulWidget {
  const FAQ({super.key});

  @override
  ConsumerState<FAQ> createState() => _FAQState();
}

class _FAQState extends ConsumerState<FAQ> {
  @override
  Widget build(BuildContext context) {
    final faqList = ref.watch(faqProvider);
    final width = MediaQuery.of(context).size.width;
    final faqWidth = width <= Sizes.mobileWidth
        ? width
        : (width > Sizes.mobileWidth && width <= Sizes.tabletWidth)
            ? width * 0.8
            : width * 0.6;

    return Column(
      children: [
        const Text(
          Strings.faqs,
          style: TextStyle(fontSize: Sizes.faqsFontSize),
        ),
        const Gap(Spaces.xLarge),
        SizedBox(
          width: faqWidth,
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                // To close other items
                for (var item in faqList) {
                  item.isExpanded = false;
                }

                faqList[index].isExpanded = isExpanded;
              });
            },
            children: faqList.map<ExpansionPanel>(
              (FAQItem item) {
                return ExpansionPanel(
                  backgroundColor: ConstColors.faqBackgroundColor,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      FaqHeader(item: item),
                  body: FAQBody(item: item),
                  isExpanded: item.isExpanded,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
