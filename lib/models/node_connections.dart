import 'package:mini_utils/mini_utils.dart';

class NodeConnections {
  NodeConnections({this.line, this.connectionId});
  Tuple2? line;
  int? connectionId;
  int? originId;
  int? destinationId;

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
}
