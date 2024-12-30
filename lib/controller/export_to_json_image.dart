import 'dart:js_interop';

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

void exportToJson(WidgetRef ref) {
  List nodeConnections = ref.read(connectionsProvider);
  List nodesList = ref.read(nodesProvider);

  Map<String, dynamic> json = {};
  json['nodes'] = {};
  json['connections'] = {};
  for (NodeData node in nodesList) {
    json['nodes'][node.nodeId] = node.toJson();
    //json.update('nodes', json['nodes'].addAll(node.toJson()));
  }
  for (NodeConnections conn in nodeConnections) {
    json['connections'][conn.connectionId] = conn.toJson();
  }
}

final widgetToImageControllerProvider =
    StateProvider((_) => WidgetsToImageController());

void myPluginDownload(Uint8List byteData) {
  // https://stackoverflow.com/questions/59783344/flutter-web-download-option
  // when building in release the file structure changes ...
  final blob = web.Blob([byteData as JSUint8Array] as JSArray<web.BlobPart>);
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..target = 'blank'
    ..download = 'png.png';
  anchor.click();
  web.URL.revokeObjectURL(url);
  // print(encoded);
}
