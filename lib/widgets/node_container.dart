import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

// @DOCSTART
// ### node_container.dart (nodeContainer) @NL
// File Responsible to the nodeContainer (The nodes in the UI) @NL
// @DOCEND

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
            ref
                .read(connectionsProvider.notifier)
                .updateConnectionsUsingNode(nodeId: data.nodeId);
          },
          childWidget: InkWell(
            onTap: () {
              /*
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
              */
              ref
                  .read(nodeIdSelected.notifier)
                  .update((state) => state = data.nodeId!);
            },
            child: Container(
              color: data.color!,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    child: Text(
                      data.title!,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorInverter(data.color!),
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    child: Text(
                      data.desc!,
                      style: TextStyle(
                        color: colorInverter(data.color!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          lockVariable: lockVariable),
    ],
  );
}
