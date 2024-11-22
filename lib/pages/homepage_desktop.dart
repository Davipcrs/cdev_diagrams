import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/widgets/option_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomepageDesktop extends ConsumerStatefulWidget {
  const HomepageDesktop({super.key});

  @override
  ConsumerState<HomepageDesktop> createState() => _HomepageDesktopState();
}

class _HomepageDesktopState extends ConsumerState<HomepageDesktop> {
  dynamic widgetList;

  /*
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    widgetList = ref.watch(nodeList);
  }
  */
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
