import 'package:cdev_diagrams/controller/application_data_controller.dart';
import 'package:cdev_diagrams/controller/node_connections_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

class NodeConnections {
  NodeConnections({this.line, this.connectionId});
  Tuple2? line;
  int? connectionId;

  // From JSON
  factory NodeConnections.fromJson(Map<String, dynamic> json) {
    return NodeConnections(
      line: json['line'] as Tuple2?,
      connectionId: json['connectionId'] as int?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'line': line,
      'connectionId': connectionId,
    };
  }

  createConnection(
      {required NodeData origin,
      required NodeData destination,
      required WidgetRef ref}) {
    // End of Def
    Tuple2<Offset, Offset> line = Tuple2(origin.position, destination.position);

    int currentId = ref
        .read(nodeConnectionIdController.notifier)
        .update((state) => state + 1);

    NodeConnections newConnection =
        NodeConnections(line: line, connectionId: currentId);

    ref.read(nodeConnectionsObjectList.notifier).state.add(newConnection);
    ref.read(nodeConnectionsList.notifier).state.add(line);
    return line;
    // Check if is in the connectionCreation Mode with the Provider
    // Add to the provider Tuple2 provider
    // Do a Choice if it is better to return the NodeConnections Object or a Tuple2
  }

  deleteConnection() {}

  updateConnection() {}

  compareLinesByPoints() {}

  compareLinesById() {}
}
