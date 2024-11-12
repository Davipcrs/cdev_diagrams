import 'package:cdev_diagrams/controller/selected_node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

Widget nodeContainer(bool lockVariable, NodeData data, WidgetRef ref) {
  return InkWell(
    onTap: () {
      ref.read(selectNodeProvider.notifier).state = data.nodeId!;
      ref.read(selectNodeDataProvider.notifier).state = data;
    },
    child: DraggableContainer(
        initPosition: const Offset(10, 10),
        childWidget: Container(
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
        lockVariable: lockVariable),
  );
}
