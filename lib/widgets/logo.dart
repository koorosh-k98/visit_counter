import 'package:flutter/material.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/values.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double padding = width <= Sizes.mobileWidth ? 0 : Spaces.xxLarge;
    return Container(
      width: Sizes.logoWidth,
      height: Sizes.logoHeight,
      padding: EdgeInsets.only(left: padding),
      child: Image.asset(Values.logo),
    );
  }
}
