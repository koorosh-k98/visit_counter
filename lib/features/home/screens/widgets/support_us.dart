import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/home/screens/widgets/support_us_button.dart';
import 'package:visit_counter/services/open_url_service/open_url_service.dart';

class SupportUs extends ConsumerWidget {
  const SupportUs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    double padding = width <= Sizes.mobileWidth ? 0 : Spaces.large;
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: SupportUsButton(
        onPressed: () => ref
            .read(openUrlServiceProvider)
            .open(Uri.parse(Strings.supportUrl)),
        title: Strings.supportUs,
      ),
    );
  }
}
