import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/node_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> list = List.empty(growable: true);
    list.add(nodeContainer(
        lockVariable: false,
        data: NodeData(
            nodeId: 0, title: "adawd", color: Colors.blue, desc: "das"),
        ref: ref,
        context: context));

    list.add(nodeContainer(
        lockVariable: false,
        data: NodeData(
            nodeId: 0, title: "adawdawd", color: Colors.blueGrey, desc: "daw"),
        ref: ref,
        context: context));
    dynamic widgetList = list;
    return Scaffold(
      body: Stack(children: widgetList),
    );
  }
}
