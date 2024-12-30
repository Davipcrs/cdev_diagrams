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
        line: json["line"] != null
            ? Tuple2(json["line"]["start"], json["line"]["end"])
            : Tuple2(Offset.zero, Offset.zero),
        connectionId: json["connectionId"] as int?,
        originId: json["originId"] as int?,
        destinationId: json["destinationId"] as int?);
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      "line": {
        "start":
            [line?.item1.dx.toString(), line?.item1.dy.toString()].toString(),
        "end": [line?.item2.dx.toString(), line?.item2.dy.toString()].toString()
      },
      "connectionId": connectionId,
      "originId": originId,
      "destinationId": destinationId
    };
  }
}
