import 'dart:io';
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final openUrlServiceProvider = Provider<OpenUrlService>(
  (ref) => OpenUrlService(),
);

class OpenUrlService {
  Future<void> open(Uri url) async {
    if (kIsWeb) {
      js.context.callMethod("open", [url.toString()]);
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
