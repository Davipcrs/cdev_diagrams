import 'dart:js_interop';
import 'dart:convert';
import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

// @DOCSTART
// ### export_to_json_image.dart (Export Options file) @NL
// File Responsible to the Export options in the program @NL
// Contains the Definition of the Functions @NL
// @NL
// - exportToJson @NL
// - myPluginDownload @NL
// - myPluginJsonDownload @NL
// @NL
// Also contains the StateProvider for the widgetToImageControllerProvider @NL
// @CBS dart

String exportToJson(WidgetRef ref) {
  List nodeConnections = ref.read(connectionsProvider);
  List nodesList = ref.read(nodesProvider);

  Map<String, dynamic> json = {};
  json["nodes"] = {};
  json["connections"] = {};
  for (NodeData node in nodesList) {
    json["nodes"][node.nodeId.toString()] = node.toJson();
    //json.update('nodes', json['nodes'].addAll(node.toJson()));
  }
  for (NodeConnections conn in nodeConnections) {
    json["connections"][conn.connectionId.toString()] = conn.toJson();
  }

  return jsonEncode(json);
}

// @CBE
// @NL
// @DOCEND

final widgetToImageControllerProvider =
    StateProvider((_) => WidgetsToImageController());

// @DOCSTART
// @CBS dart

Future<void> myPluginDownload(Future<Uint8List?> promisseByteData) async {
  Uint8List? byteData = await promisseByteData;
  final blob = web.Blob([byteData as JSUint8Array] as JSArray<web.BlobPart>);
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..target = 'blank'
    ..download = 'cdev_diagram_exported.png';
  anchor.click();
  web.URL.revokeObjectURL(url);
  // print(encoded);
}

// @CBE
// @NL
// @DOCEND

Future<void> myPluginJsonDownload(String jsonString) async {
  final bytes = utf8.encode(jsonString);
  final blob = web.Blob([bytes as JSUint8Array] as JSArray<web.BlobPart>);
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..target = 'data.json'
    ..download = 'cdev_diagram_exported.json';
  anchor.click();
  web.URL.revokeObjectURL(url);
}
