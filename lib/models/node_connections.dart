import 'package:flutter/material.dart';
import 'package:mini_utils/mini_utils.dart';

// @DOCSTART
// ### node_connections.dart (NodeConnections) @NL
// ##### This is a Model File @NL
// This file is responsible to guard the Model of the connections
// of the nodes inside the application
// @CBS dart
class NodeConnections {
  NodeConnections(
      {this.line, this.connectionId, this.originId, this.destinationId});
  Tuple2<Offset, Offset>? line;
  int? connectionId;
  int? originId;
  int? destinationId;

// @CBE
// @NL
// @DOCEND

// @DOCSTART
// JSON operations (NodeConnections) @NL
// @CBS dart
  factory NodeConnections.fromJson(Map<String, dynamic> json) {
    return NodeConnections(
        line: json["line"] != null
            ? Tuple2(
                Offset(
                  double.parse(json["line"]["start"][0]),
                  double.parse(json["line"]["start"][1]),
                ),
                Offset(
                  double.parse(json["line"]["end"][0]),
                  double.parse(json["line"]["end"][1]),
                ),
              )
            : Tuple2(Offset.zero, Offset.zero),
        connectionId: json["connectionId"] as int?,
        originId: json["originId"] as int?,
        destinationId: json["destinationId"] as int?);
  }

// To JSON
  Map<String, dynamic> toJson() {
    return {
      "line": {
        "start": [line?.item1.dx.toString(), line?.item1.dy.toString()],
        "end": [line?.item2.dx.toString(), line?.item2.dy.toString()]
      },
      "connectionId": connectionId,
      "originId": originId,
      "destinationId": destinationId
    };
  }
// @CBE
// @NL
// @DOCEND
}
