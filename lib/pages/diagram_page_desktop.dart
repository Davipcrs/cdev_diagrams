import 'package:cdev_diagrams/controller/data_repository.dart';
import 'package:cdev_diagrams/controller/data_repository_auxiliar.dart';
import 'package:cdev_diagrams/models/node_connections.dart';
import 'package:cdev_diagrams/models/node_data.dart';
import 'package:cdev_diagrams/widgets/node_container.dart';
import 'package:cdev_diagrams/widgets/option_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_utils/mini_utils.dart';

class DiagramPageDesktop extends ConsumerStatefulWidget {
  const DiagramPageDesktop({super.key});

  @override
  ConsumerState<DiagramPageDesktop> createState() => _DiagramPageDesktopState();
}

class _DiagramPageDesktopState extends ConsumerState<DiagramPageDesktop> {
  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    List<NodeConnections> connectionsAuxiliar = ref.watch(connectionsProvider);
    List<Tuple2<Offset, Offset>> linesAuxiliar = [];
    for (final item in connectionsAuxiliar) {
      linesAuxiliar.add(item.line as Tuple2<Offset, Offset>);
    }
    List<NodeData> nodes = ref.watch(nodesProvider);
    if (widgetList.isNotEmpty) {
      widgetList = [];
    }
    for (final NodeData item in nodes) {
      widgetList.add(nodeContainer(
          lockVariable: ref.watch(nodeGlobalLockProvider),
          data: item,
          ref: ref,
          context: context));
    }
    //ref.watch(nodeCounterProvider);
    //widgetList = ref.watch(nodeList);
    //dynamic widgetList = ref.watch(nodeList);
    //print(ref.watch(nodeCounterProvider));
    // Not re-building widget after added
    //print(widgetList);
    return Scaffold(
      body: Row(
        children: [
          const OptionBar(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 300,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width - 300,
                      MediaQuery.sizeOf(context).height),
                  painter: LineConnectorPainter(
                      lines: linesAuxiliar,
                      lineColor: Theme.of(context).colorScheme.onSurface),
                ),
                Stack(
                  children: widgetList,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
