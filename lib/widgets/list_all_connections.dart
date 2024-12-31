import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/widgets/auxiliar_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget listAllConnections(
    {required BuildContext context,
    required List<NodeConnections> dataList,
    required WidgetRef ref}) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: nodeConnectionsAuxiliarContainer(
                  context: context, data: dataList[index]),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(connectionsProvider.notifier)
                    .removeConnection(connId: dataList[index].connectionId!);
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
