import 'package:flutter/material.dart';
import 'package:mini_utils/mini_utils.dart';

class NodeConnections {
  NodeConnections(
      {this.line, this.connectionId, this.originId, this.destinationId});
  Tuple2<Offset, Offset>? line;
  int? connectionId;
  int? originId;
  int? destinationId;

  // From JSON
  factory NodeConnections.fromJson(Map<String, dynamic> json) {
    return NodeConnections(
        line: json['line'] as Tuple2<Offset, Offset>?,
        connectionId: json['connectionId'] as int?,
        originId: json['originId'] as int?,
        destinationId: json['destinationId'] as int?);
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'line': line,
      'connectionId': connectionId,
      'originId': originId,
      'destinationId': destinationId
    };
  }
}
