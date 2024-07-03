import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/home/data/models/contact_us_item.dart';

final contactUsProvider = Provider<List<ContactUsItem>>((ref) => [
      ContactUsItem(
        backgroundColor: ConstColors.githubBackgroundColor,
        icon: FontAwesomeIcons.github,
        url: Uri.parse(Values.githubUrl),
      ),
      ContactUsItem(
        backgroundColor: ConstColors.linkedInBackgroundColor,
        icon: FontAwesomeIcons.linkedin,
        url: Uri.parse(Values.linkedInUrl),
      ),
      ContactUsItem(
        backgroundColor: ConstColors.xBackgroundColor,
        icon: FontAwesomeIcons.xTwitter,
        url: Uri.parse(Values.xUrl),
      ),
    ]);
