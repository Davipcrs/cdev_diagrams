import 'dart:ui';
// https://chatgpt.com/c/67528b2e-78e4-800b-a8b8-756c7fed511e
// using notifier, because StateNotifier will be Depracated
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NodeModelManager extends Notifier {
  @override
  build() => [];

  void addNode({required NodeData node}) {
    state = {...state, node};
  }

  void updatePosition({required int nodeId, required Offset newPos}) {}
  NodeData getNodeDataById({required int id}) {
    return NodeData();
  }
}

class NodeConnectionsManager extends Notifier {
  @override
  build() => [];

  void addConnection({required NodeConnections connection}) {
    state = {...state, connection};
  }

  List getAllConnectionsForNode({required int nodeId}) {
    return [];
  }

  List getAllConnections() {
    return [];
  }
}
