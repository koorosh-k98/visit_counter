import 'package:flutter/material.dart';

class ContactUsItem {
  ContactUsItem({
    required this.backgroundColor,
    required this.icon,
    required this.url,
  });

  final Color backgroundColor;
  final IconData icon;
  final Uri url;
}
