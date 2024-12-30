import 'dart:convert';
import 'dart:typed_data';

void importToJson(Uint8List bytes) {
  String utf8String = utf8.decode(bytes);
  Map<String, dynamic> jsonAsMap = jsonDecode(utf8String);
  print(jsonAsMap);
  return;
}
