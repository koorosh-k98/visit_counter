import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/sizes.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/features/home/data/models/contact_us_item.dart';
import 'package:visit_counter/services/open_url_service/open_url_service.dart';

class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({
    super.key,
    required this.contactUsItem,
  });

  final ContactUsItem contactUsItem;

  @override
  ConsumerState<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends ConsumerState<ContactUs> {
  bool isHovered = false;

  void isEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    const containerSize = Sizes.contactUsButtonSize;

    final matrixTransform = Matrix4.identity()
      ..translate(containerSize / 2, containerSize / 2)
      ..scale(1.25)
      ..translate(-containerSize / 2, -containerSize / 2);

    final transform = isHovered ? matrixTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => isEntered(true),
      onExit: (event) => isEntered(false),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: Values.contactUsAnimationDuration,
        ),
        padding: const EdgeInsets.all(Spaces.medium),
        transform: transform,
        child: GestureDetector(
          onTap: () =>
              ref.read(openUrlServiceProvider).open(widget.contactUsItem.url),
          child: CircleAvatar(
            backgroundColor: widget.contactUsItem.backgroundColor,
            child: Icon(widget.contactUsItem.icon),
          ),
        ),
      ),
    );
  }
}
