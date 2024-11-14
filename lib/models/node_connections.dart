class NodeConnections {
  NodeConnections({this.originNodeId, this.destNodeId, this.connectionId});
  int? originNodeId;
  int? destNodeId;
  int? connectionId;

  // From JSON
  factory NodeConnections.fromJson(Map<String, dynamic> json) {
    return NodeConnections(
      originNodeId: json['originNodeId'] as int?,
      destNodeId: json['destNodeId'] as int?,
      connectionId: json['connectionId'] as int?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'originNodeId': originNodeId,
      'destNodeId': destNodeId,
      'connectionId': connectionId,
    };
  }
}
