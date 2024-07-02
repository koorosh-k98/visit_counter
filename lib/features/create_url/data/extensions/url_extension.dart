import 'package:visit_counter/constants/strings.dart';

typedef URL = String;

extension UrlExtension on URL {
  String toMarkDown() {
    return "[![]($this)](${Strings.webUrl})";
  }

  String toHTML() {
    return '''<a href="${Strings.webUrl}">
  <img src="$this"/>
</a>''';
  }
}
