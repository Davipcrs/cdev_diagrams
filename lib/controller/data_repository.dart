import 'dart:ui';
// https://chatgpt.com/c/67528b2e-78e4-800b-a8b8-756c7fed511e
// using notifier, because StateNotifier will be Depracated
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

class NodeModelManager extends Notifier<List<NodeData>> {
  @override
  build() => [];

  void addNode({required NodeData node}) {
    state = [...state, node];
  }

  void updatePosition({required int nodeId, required Offset newPos}) {
    state = [
      for (final NodeData data in state)
        if (data.nodeId == nodeId) data.updatePos(newPos) else data
    ];
  }

  void removeNode({required int nodeId}) {
    List auxliarList = [];
    for (final NodeData item in state) {
      if (item.nodeId != nodeId) {
        auxliarList.add(item);
      }
    }
    state = [...auxliarList];
  }
}

class NodeConnectionsManager extends Notifier<List<NodeConnections>> {
  @override
  build() => [];

  void addConnection({required NodeConnections connection}) {
    state = [...state, connection];
  }

  void updateConnectionsUsingNode({required nodeId}) {
    List<NodeData> nodes = ref.watch(nodesProvider);
//    int index = nodes.indexWhere((element) => element.nodeId == nodeId);
    for (final NodeConnections conn in state) {
      if (conn.originId == nodeId || conn.destinationId == nodeId) {
        //conn.line = Tuple2(, item2);
      }
    }
  }

  void updateConnection({required connId}) {}

  void removeConnection({required connId}) {
    state = [
      for (final NodeConnections conn in state)
        if (conn.connectionId != connId) conn
    ];
  }
}

final nodesProvider = NotifierProvider<NodeModelManager, List<NodeData>>(
  () {
    return NodeModelManager();
  },
);
