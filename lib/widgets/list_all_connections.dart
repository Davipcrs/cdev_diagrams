import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/widgets/auxiliar_containers.dart';
import 'package:flutter/material.dart';

Widget listAllConnections(
    {required BuildContext context, required List<NodeConnections> dataList}) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: nodeConnectionsAuxiliarContainer(
            context: context, data: dataList[index]),
      );
    },
    itemCount: dataList.length,
  );
  // Listview
}
