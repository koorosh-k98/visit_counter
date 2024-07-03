import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/strings.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.developedWith),
        Icon(FontAwesomeIcons.solidHeart, color: ConstColors.footerIconColor),
        Text(Strings.byKooroshKarkehabadi),
      ],
    );
  }
}
