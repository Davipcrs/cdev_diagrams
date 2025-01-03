import 'package:flutter/material.dart';

// @DOCSTART
// ### node_data.dart (NodeData) @NL
// ##### This is a Model File @NL
// File Responsible to the NodeData (Title, desc...) in the application @NL
// @CBS dart
class NodeData {
  NodeData(
      {this.nodeId,
      this.title,
      this.color,
      this.desc,
      this.position = Offset.zero});
  int? nodeId;
  String? title;
  Color? color;
  String? desc;
  Offset position;

// @CBE
// @NL
// @DOCEND

  // From JSON
  factory NodeData.fromJson(Map<String, dynamic> json) {
    return NodeData(
      nodeId: json["nodeId"] as int?,
      title: json["title"] as String?,
      color: json["color"] != null ? Color(json["color"]) : null,
      desc: json["desc"] as String?,
      position: json["position"] != null
          ? Offset(
              json["position"]["dx"] as double,
              json["position"]["dy"] as double,
            )
          : Offset.zero,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      "nodeId": nodeId,
      "title": title,
      "color": color?.value,
      "desc": desc,
      "position": {
        "dx": position.dx,
        "dy": position.dy,
      },
    };
  }

  updatePos(Offset newPos) {
    position = newPos;
    return this;
  }
}
