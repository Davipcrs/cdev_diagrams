import 'package:cdev_diagrams/models/node_data.dart';
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

  createConnection({required NodeData origin, required NodeData destination}) {
    // Check if is in the connectionCreation Mode with the Provider
    // Add to the provider Tuple2 provider
    // Do a Choice if it is better to return the NodeConnections Object or a Tuple2
  }

  deleteConnection() {}

  updateConnection() {}
}
