import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final openUrlServiceProvider = Provider<OpenUrlService>((ref) => OpenUrlService());

class OpenUrlService {
  Future<void> open(Uri url) async {
    if (!await canLaunchUrl(url)) {
      throw 'Could not launch $url';
    }

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}