import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/home/data/models/contact_us_item.dart';
import 'package:visit_counter/features/home/data/providers/contact_us_provider.dart';
import 'package:visit_counter/features/home/screens/widgets/contact_us.dart';
import 'package:visit_counter/services/open_url_service/open_url_service.dart';

class ContactUsSection extends ConsumerWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsList = ref.watch(contactUsProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: contactUsList
              .map<ContactUs>((ContactUsItem contactUs) =>
                  ContactUs(contactUsItem: contactUs))
              .toList(),
        ),
        const Gap(Spaces.large),
        InkWell(
          onTap: () => ref.read(openUrlServiceProvider).open(Values.emailUri),
          child: Container(
            width: Sizes.contactUsEmailWidth,
            padding: const EdgeInsets.all(Spaces.medium),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.envelope),
                Gap(Spaces.medium),
                Text(Values.kooroshEmail),
              ],
            ),
          ),
        )
      ],
    );
  }
}
