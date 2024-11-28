import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

final nodeConnectionStart = StateProvider((_) => NodeData());
final nodeConnectionEnd = StateProvider((_) => NodeData());
final nodeConnectionsList = StateProvider((_) {
  List<Tuple2<Offset, Offset>> connectionList =
      List<Tuple2<Offset, Offset>>.empty(growable: true);
  return connectionList;
});
final nodeConnectionsIsActive = StateProvider((_) => false);
