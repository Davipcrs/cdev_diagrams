import 'package:cdev_diagrams/controller/node_connections_controller.dart';
import 'package:cdev_diagrams/controller/node_controller.dart';
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
  dynamic widgetList;

  @override
  Widget build(BuildContext context) {
    ref.watch(nodeCounterProvider);
    widgetList = ref.watch(nodeList);
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
                      lines: ref.watch(nodeConnectionsList),
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
