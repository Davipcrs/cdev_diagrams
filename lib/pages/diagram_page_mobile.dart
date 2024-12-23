import 'package:cdev_diagrams/widgets/option_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiagramPageMobile extends ConsumerStatefulWidget {
  const DiagramPageMobile({super.key});

  @override
  ConsumerState<DiagramPageMobile> createState() => _DiagramPageMobileState();
}

class _DiagramPageMobileState extends ConsumerState<DiagramPageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  dynamic widgetList;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    //widgetList = ref.watch(nodeList);
  }

  @override
  Widget build(BuildContext context) {
    //ref.watch(nodeCounterProvider);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const OptionBar(),
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu_rounded),
          ),
          Stack(
            children: widgetList,
          )
        ],
      ),
    );
  }
}
