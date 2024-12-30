import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart';
import 'package:flutter/foundation.dart';

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
  print(json);
}

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
