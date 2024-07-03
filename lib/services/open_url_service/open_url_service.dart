import 'dart:io';
import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final openUrlServiceProvider = Provider<OpenUrlService>(
  (ref) => OpenUrlService(),
);

class OpenUrlService {
  Future<void> open(Uri url) async {
    if (kIsWeb) {
      js.globalContext.callMethod("open".toJS, url.toString().toJS);
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
