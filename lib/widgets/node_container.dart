import 'package:cdev_diagrams/controller/node_connections_controller.dart';
import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

Widget nodeContainer({
  required lockVariable,
  required NodeData data,
  required WidgetRef ref,
  required BuildContext context,
}) {
  return Stack(
    children: [
      DraggableContainer(
          initPosition: data.position,
          onMove: (val) {
            data.position = val;
          },
          // Handle out of bounds
          childWidget: InkWell(
            onTap: () {
              if (ref.watch(nodeConnectionsIsActive)) {
                // DESIGN THIS BETTER!!!
                // Create a fuction that is responsible for this...
                ref.read(nodeConnectionStart.notifier).state =
                    ref.watch(selectNodeDataProvider);
                ref.read(nodeConnectionEnd.notifier).state = data;

                ref.read(nodeConnectionsList.notifier).state.add(Tuple2(
                    ref.watch(selectNodeDataProvider).position, data.position));
                return;
              }
              // Read Offset of the widget and pass to the Data variable.
              ref.read(selectNodeProvider.notifier).state = data.nodeId!;
              ref.read(selectNodeDataProvider.notifier).state = data;
              ref.read(isNodeSelected.notifier).state = true;

              // Compare the nodeConnectionsStart and End to draw the line.
            },
            child: Container(
              color: data.color!,
              child: Column(
                children: [
                  Text(
                    data.title!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Divider(),
                  Text(data.desc!),
                ],
              ),
            ),
          ),
          lockVariable: lockVariable),
    ],
  );
}
