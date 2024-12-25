// Quando selecionado um dos Nodes, option_bar vai liberar um botão que irá abrir um Widget para escolher
// em uma lista o widget de destino da connection;

import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/auxiliar_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

Widget createConnectionDialog(BuildContext context, WidgetRef ref) {
  List<NodeData> nodeList = ref.watch(nodesProvider);
  int selectedNodeId = ref.watch(nodeIdSelected);
  List<NodeData> possibleNodesToConnect = [];
  NodeData actual = NodeData();
  for (NodeData data in nodeList) {
    if (data.nodeId == selectedNodeId) {
      actual = data;
    } else {
      possibleNodesToConnect.add(data);
    }
  }
  return Dialog(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          const Text("Select a Node to create the conection"),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              itemCount: possibleNodesToConnect.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: nodeDataAuxiliarContainer(
                      context: context, data: possibleNodesToConnect[index]),
                  onTap: () {
                    int id = ref
                        .read(nodeConnectionIdCreationController.notifier)
                        .update((state) => state + 1);
                    NodeConnections conn = NodeConnections(
                        line: Tuple2(actual.position,
                            possibleNodesToConnect[index].position),
                        connectionId: id,
                        originId: actual.nodeId,
                        destinationId: possibleNodesToConnect[index].nodeId);

                    ref
                        .read(connectionsProvider.notifier)
                        .addConnection(connection: conn);
                  },
                );
              },
            ),
          ),
          //Listview
        ],
      ),
    ),
  );
}
