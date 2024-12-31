import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/auxiliar_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget listAllNodes(
    {required BuildContext context,
    required List<NodeData> dataList,
    required WidgetRef ref}) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: nodeDataAuxiliarContainer(
                    context: context, data: dataList[index])),
            IconButton(
              onPressed: () {
                ref
                    .read(nodesProvider.notifier)
                    .removeNode(nodeId: dataList[index].nodeId!);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      );
    },
    itemCount: dataList.length,
  );
  // Listview
}
