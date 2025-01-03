import 'dart:convert';
import 'dart:typed_data';

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// @DOCSTART
// ### import_from_json.dart (import Function) @NL
// File Responsible to the load option in the application @NL
// @CBS dart

void importFromJson(Uint8List bytes, WidgetRef ref) {
  String utf8String = utf8.decode(bytes);
  Map<String, dynamic> jsonAsMap = jsonDecode(utf8String);
  Map<String, dynamic> nodesJson = jsonAsMap["nodes"];
  Map<String, dynamic> connectionJson = jsonAsMap["connections"];

  for (final data in nodesJson.entries) {
    NodeData auxiliar = NodeData.fromJson(data.value);
    ref.read(nodesProvider.notifier).addNode(node: auxiliar);
    if (ref.read(nodeIdCreationController) < auxiliar.nodeId!) {
      ref.read(nodeIdCreationController.notifier).state = auxiliar.nodeId!;
    }
  }

  for (final data in connectionJson.entries) {
    NodeConnections auxiliar = NodeConnections.fromJson(data.value);
    ref.read(connectionsProvider.notifier).addConnection(connection: auxiliar);
    if (ref.read(nodeConnectionIdCreationController) < auxiliar.connectionId!) {
      ref.read(nodeConnectionIdCreationController.notifier).state =
          auxiliar.connectionId!;
    }
  }
}

// @CBE
// @NL
// @DOCEND
