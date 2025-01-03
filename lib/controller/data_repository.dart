import 'dart:ui';
// https://chatgpt.com/c/67528b2e-78e4-800b-a8b8-756c7fed511e
// using notifier, because StateNotifier will be Depracated
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

// @DOCSTART
// ### data_repository.dart (ModelManagers) @NL
// File Responsible to hold the Providers that save the data of the application @NL
// Contains the Definition of the: @NL
// - NodeModelManager @NL
// - NodeConnectionManager @NL
// - nodesProvider (Instance of NodeModelManger) @NL
// - connectionsProvider (Instace of NodeConnectionsManager) @NL
// @CBS dart

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

  void updateNode({required NodeData updatedNode}) {
    state = [
      for (final NodeData data in state)
        if (data.nodeId == updatedNode.nodeId) updatedNode else data
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
    List<NodeData> nodes = ref.read(nodesProvider);
    int index = nodes.indexWhere((element) => element.nodeId == nodeId);
    for (final NodeConnections conn in state) {
      if (conn.originId == nodeId) {
        conn.line = Tuple2(nodes[index].position, conn.line!.item2);
      } else if (conn.destinationId == nodeId) {
        conn.line = Tuple2(conn.line!.item1, nodes[index].position);
      }
    }
  }

  void removeConnection({required connId}) {
    state = [
      for (final NodeConnections conn in state)
        if (conn.connectionId != connId) conn
    ];
  }
}

// @CBE
// @NL
// @DOCEND
final nodesProvider = NotifierProvider<NodeModelManager, List<NodeData>>(
  () {
    return NodeModelManager();
  },
);

final connectionsProvider =
    NotifierProvider<NodeConnectionsManager, List<NodeConnections>>(
  () {
    return NodeConnectionsManager();
  },
);
