import 'package:cdev_diagrams/controller/node_controller.dart';
import 'package:cdev_diagrams/widgets/option_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomepageMobile extends ConsumerStatefulWidget {
  const HomepageMobile({super.key});

  @override
  ConsumerState<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends ConsumerState<HomepageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  dynamic widgetList;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    widgetList = ref.watch(nodeList);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(nodeCounterProvider);
    return Scaffold(
      key: _scaffoldKey,
      drawer: OptionBar(),
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
