import 'dart:convert';
import 'dart:typed_data';

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void importFromJson(Uint8List bytes, WidgetRef ref) {
  String utf8String = utf8.decode(bytes);
  Map<String, dynamic> jsonAsMap = jsonDecode(utf8String);
  Map<String, dynamic> nodesJson = jsonAsMap["nodes"];
  Map<String, dynamic> connectionJson = jsonAsMap["connections"];

  for (final data in nodesJson.entries) {
    ref
        .read(nodesProvider.notifier)
        .addNode(node: NodeData.fromJson(data.value));
  }

  for (final data in connectionJson.entries) {
    ref
        .read(connectionsProvider.notifier)
        .addConnection(connection: NodeConnections.fromJson(data.value));
  }
}
