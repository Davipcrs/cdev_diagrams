import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nodeCounterProvider = StateProvider((_) => 0);
final nodeList = StateProvider<List<Widget>>((_) {
  List<Widget> widgetsList = List<Widget>.empty(growable: true);
  return widgetsList;
});

final nodeGlobalLockProvider = StateProvider((_) => false);

final selectNodeProvider = StateProvider((_) => 0);
final selectNodeDataProvider = StateProvider((_) => NodeData());
final isNodeSelected = StateProvider((_) => false);
