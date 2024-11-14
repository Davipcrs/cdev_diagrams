import 'package:cdev_diagrams/controller/selected_node_controller.dart';
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
          initPosition: const Offset(100, 100),
          onMove: (val) => data.position = val,
          childWidget: InkWell(
            onTap: () {
              // Read Offset of the widget and pass to the Data variable.
              print(data.position.dx);
              ref.read(selectNodeProvider.notifier).state = data.nodeId!;
              ref.read(selectNodeDataProvider.notifier).state = data;
            },
            child: Container(
              width: 100,
              height: 100,
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
