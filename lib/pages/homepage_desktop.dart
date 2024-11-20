import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/widgets/option_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomepageDesktop extends ConsumerWidget {
  const HomepageDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic widgetList = ref.watch(nodeList);
    return Scaffold(
      body: Row(
        children: [
          OptionBar(),
          SizedBox(
            child: Stack(children: widgetList),
            width: MediaQuery.sizeOf(context).width - 300,
          ),
        ],
      ),
    );
  }
}
