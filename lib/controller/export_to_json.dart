import 'package:web/web.dart';
import 'package:flutter/foundation.dart';

void exportToJson() {}

void myPluginDownload(String url) {
  // https://stackoverflow.com/questions/59783344/flutter-web-download-option
  // when building in release the file structure changes ...
  if (kReleaseMode) {
    url = "assets/$url";
  }
  HTMLAnchorElement()
    ..href = url
    ..download = url
    ..click();
}
