import 'package:visit_counter/constants/strings.dart';

typedef URL = String;

extension UrlExtension on URL {
  String toMarkDown() {
    return "[![]($this)](${Strings.baseUrl})";
  }

  String toHTML() {
    return '''<a href="${Strings.baseUrl}">
  <img src="$this"/>
</a>''';
  }
}
