import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/auxiliar_containers.dart';
import 'package:flutter/material.dart';

Widget listAllNodes(
    {required BuildContext context, required List<NodeData> dataList}) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            nodeDataAuxiliarContainer(context: context, data: dataList[index]),
      );
    },
    itemCount: dataList.length,
  );
  // Listview
}
