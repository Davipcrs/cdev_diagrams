// Create provider for the NodeData and NodeConnection Objects
// These providers will be used to store the reference to the object in the aplication without the need of widget
// for better usage, the nodeContainer Widget list will be used and the Tuple2 will be used as well...
// This is be used for the recreation and export of a Diagram.

import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nodeConnectionsObjectList = StateProvider((_) {
  List<NodeConnections> connectionList =
      List<NodeConnections>.empty(growable: true);
  return connectionList;
});

final nodeDataObjectList = StateProvider((_) {
  List<NodeData> nodeDataList = List<NodeData>.empty(growable: true);
  return nodeDataList;
});
